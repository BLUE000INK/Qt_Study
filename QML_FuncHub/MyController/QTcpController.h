#ifndef QTCPCONTROLLER_H
#define QTCPCONTROLLER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QTimer>
class QTcpController : public QObject
{
    Q_OBJECT
public:
    QTcpController();
    Q_INVOKABLE void initServerEnv();
    Q_INVOKABLE bool createServer(QString ip,QString port);
    Q_INVOKABLE bool sendMsgToClient(QString msg);
    Q_INVOKABLE void closeServer();

    Q_INVOKABLE void initClientEnv();
    Q_INVOKABLE bool connectServer(QString ip,QString port);
    Q_INVOKABLE bool sendMsgToServer(QString msg);
    Q_INVOKABLE void closeClient();

    Q_INVOKABLE void releaseSrc();

signals:
    void sendInfo(QString info);
    void clientLogIn();
    void connectSucceed();

    void serverClosed();
    void clientExited();

private:
    QTcpSocket* mySocket;
    QTcpServer* myServer;
    QTimer* timer;

    bool makeClose;
    void connectLoop(bool val);
};

#endif // QTCPCONTROLLER_H
