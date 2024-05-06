#include "ChartController.h"

ChartController::ChartController() {
    myRandomValue = new QRandomGenerator();
}

QDateTime ChartController::getRightDateTime()
{
    return QDateTime::currentDateTime();
}

QDateTime ChartController::getLeftDateTime()
{
    return QDateTime::currentDateTime().addSecs(-1 * timeSpacing);
}

qint64 ChartController::getLocalTimeToPointX()
{
    return QDateTime::currentDateTime().toMSecsSinceEpoch();
}

QDateTime ChartController::dateTimeAddSecs(QDateTime time, int value)
{
    return time.addSecs(value);
}

float ChartController::getSeriesValue(const QString &name)
{
    //qDebug()<< "getSeriesValue name is:" << name;


    return myRandomValue->bounded(0,100);
}

float ChartController::getInitSeriesValue(const QString &name, int index)
{
    return myRandomValue->bounded(0,10);
}













