#include "QTcpController.h"

QTcpController::QTcpController()
{

}

void QTcpController::initServerEnv()
{

}

bool QTcpController::createServer(QString ip,QString port)
{

    myServer = new QTcpServer();
    mySocket = new QTcpSocket();
    bool result =  myServer->listen(QHostAddress::Any,port.toInt());
    if(!result)
        return false;
    if(result){
        connect(myServer,&QTcpServer::newConnection,[=](){
            mySocket = myServer->nextPendingConnection();
            emit clientLogIn();
            makeClose = false;
            connect(mySocket,&QTcpSocket::readyRead,[=](){
                QString recMesg = mySocket->readAll();
                emit sendInfo("收到来自客户端的信息:"+recMesg);
            });

            connect(mySocket,&QTcpSocket::disconnected,[=](){
                if(!makeClose){
                    emit clientExited();
                    delete mySocket;
                    mySocket = NULL;
                }

            });
        });
    }
    return true;
}

bool QTcpController::sendMsgToClient(QString msg)
{
    mySocket->write(msg.toLatin1());
    return true;
}

void QTcpController::closeServer()
{
    //没有连接时手动关闭
    //存在连接时手动关闭
    makeClose = true;
    if(mySocket){
        delete mySocket;
        mySocket = NULL;
    }
    if(myServer){
        myServer->close();
    }

}

void QTcpController::initClientEnv()
{
    makeClose = false;
    timer = new QTimer();
    timer->setInterval(1000);
}

bool QTcpController::connectServer(QString ip, QString port)
{
    mySocket = new QTcpSocket();


    connect(timer,&QTimer::timeout,this,[=](){
        mySocket->connectToHost(QHostAddress(ip),port.toInt());
    });

    connect(mySocket, &QTcpSocket::connected,[=](){
        connectLoop(false);
        emit connectSucceed();
    });
    connect(mySocket,&QTcpSocket::readyRead,[=](){
        QString recMesg = mySocket->readAll();
        emit sendInfo("收到来自服务器的信息:"+recMesg);
    });
    connect(mySocket,&QTcpSocket::disconnected,[=](){
        connectLoop(true);
        emit serverClosed();
    });

    connectLoop(true);
    return true;
}

bool QTcpController::sendMsgToServer(QString msg)
{
    mySocket->write(msg.toLatin1());
    return true;
}

void QTcpController::closeClient()
{
    //没有连接时手动关闭
    //存在连接时手动关闭
    if(mySocket){
        mySocket->close();
        delete mySocket;
        mySocket = NULL;

    }
    connectLoop(false);
}

void QTcpController::releaseSrc()
{
    if(myServer != nullptr){
        //myServer->close();
        if(myServer->isListening()){
            myServer->close();
        }
        myServer->deleteLater();
        myServer = NULL;
    }else {
        if(mySocket != nullptr){
            mySocket->deleteLater();
            mySocket = NULL;
        }
    }
    if(timer != nullptr){
        delete timer;
        timer = NULL;
    }
}

void QTcpController::connectLoop(bool val)
{
    if(val){
        timer->start();
    }else {
        timer->stop();
    }
}
