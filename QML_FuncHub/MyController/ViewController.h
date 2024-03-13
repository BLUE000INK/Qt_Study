#ifndef VIEWCONTROLLER_H
#define VIEWCONTROLLER_H

#include <QObject>

class ViewController : public QObject
{
    Q_OBJECT
public:
    ViewController();
    Q_INVOKABLE void Regist_Model_Foods();
};

#endif // VIEWCONTROLLER_H
