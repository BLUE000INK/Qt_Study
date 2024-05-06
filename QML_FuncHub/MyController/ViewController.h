#ifndef VIEWCONTROLLER_H
#define VIEWCONTROLLER_H

#include <QObject>
#include <QDateTime>
class ViewController : public QObject
{
    Q_OBJECT
public:
    ViewController();
    Q_INVOKABLE void Regist_Model_Foods();
    Q_INVOKABLE QDateTime getCurrentTime();
};

#endif // VIEWCONTROLLER_H
