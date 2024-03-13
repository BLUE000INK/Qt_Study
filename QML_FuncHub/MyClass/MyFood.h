#ifndef MYFOOD_H
#define MYFOOD_H

#include <QObject>

class MyFood : public QObject
{
    Q_OBJECT
public:
    MyFood();
    MyFood(QString name, int price, float calories, float weight, QString desc);
    QString getFoodName() const;
    void setFoodName(const QString &newFoodName);
    int getFoodPrice() const;
    void setFoodPrice(int newFoodPrice);
    float getFoodCalories() const;
    void setFoodCalories(float newFoodCalories);
    float getFoodWeight() const;
    void setFoodWeight(float newFoodWeight);
    QString getFoodDesc() const;
    void setFoodDesc(const QString &newFoodDesc);

signals:
    void foodNameChanged();
    void foodPriceChanged();
    void foodCaloriesChanged();
    void foodWeightChanged();
    void foodDescChanged();

private:
    QString foodName;
    int foodPrice;
    float foodCalories;
    float foodWeight;
    QString foodDesc;
    Q_PROPERTY(QString foodName READ getFoodName WRITE setFoodName NOTIFY foodNameChanged FINAL)
    Q_PROPERTY(int foodPrice READ getFoodPrice WRITE setFoodPrice NOTIFY foodPriceChanged FINAL)
    Q_PROPERTY(float foodCalories READ getFoodCalories WRITE setFoodCalories NOTIFY foodCaloriesChanged FINAL)
    Q_PROPERTY(float foodWeight READ getFoodWeight WRITE setFoodWeight NOTIFY foodWeightChanged FINAL)
    Q_PROPERTY(QString foodDesc READ getFoodDesc WRITE setFoodDesc NOTIFY foodDescChanged FINAL)
};

#endif // MYFOOD_H
