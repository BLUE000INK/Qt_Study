#ifndef MYTHREAD01_H
#define MYTHREAD01_H

#include <QThread>

class MyThread01 : public QThread
{
    Q_OBJECT
public:
    MyThread01();
    ~MyThread01();
protected:
    void run() Q_DECL_OVERRIDE;
signals:
    void threadSignal(int val);
};

#endif // MYTHREAD01_H
