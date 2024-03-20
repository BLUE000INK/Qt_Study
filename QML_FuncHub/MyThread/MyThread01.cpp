#include "MyThread01.h"
#include "QDebug"
MyThread01::MyThread01()
{

}

MyThread01::~MyThread01()
{
    qDebug()<<"线程退出，并回收资源！";
}

void MyThread01::run()
{
    int i = 0;
    for(;;){
        emit threadSignal(i++);
        qDebug()<< i<< Qt::endl;
        this->sleep(1);
    }
}
