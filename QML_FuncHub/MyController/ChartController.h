#ifndef CHARTCONTROLLER_H
#define CHARTCONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QRandomGenerator>
#include "../MyClass/MyChart.h"
using namespace QtCharts;

class ChartController : public QObject
{
    Q_OBJECT
public:
    ChartController();
    Q_INVOKABLE QDateTime getRightDateTime();
    Q_INVOKABLE QDateTime getLeftDateTime();
    Q_INVOKABLE qint64 getLocalTimeToPointX();
    Q_INVOKABLE QDateTime dateTimeAddSecs(QDateTime time, int value);
    Q_INVOKABLE float getSeriesValue(const QString& name);
    Q_INVOKABLE float getInitSeriesValue(const QString& name, int index);
private:
    MyChart* myChart;
    const static int timeSpacing = 600;
    QRandomGenerator *myRandomValue;
};

#endif // CHARTCONTROLLER_H
