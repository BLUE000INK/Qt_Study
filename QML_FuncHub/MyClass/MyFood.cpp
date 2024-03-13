#include "MyFood.h"

MyFood::MyFood()
{

}

MyFood::MyFood(QString name, int price, float calories, float weight, QString desc)
{
    foodName = name;
    foodPrice = price;
    foodCalories = calories;
    foodWeight = weight;
    foodDesc = desc;
}

QString MyFood::getFoodName() const
{
    return foodName;
}

void MyFood::setFoodName(const QString &newFoodName)
{
    if (foodName == newFoodName)
        return;
    foodName = newFoodName;
    emit foodNameChanged();
}

int MyFood::getFoodPrice() const
{
    return foodPrice;
}

void MyFood::setFoodPrice(int newFoodPrice)
{
    if (foodPrice == newFoodPrice)
        return;
    foodPrice = newFoodPrice;
    emit foodPriceChanged();
}

float MyFood::getFoodCalories() const
{
    return foodCalories;
}

void MyFood::setFoodCalories(float newFoodCalories)
{
    if (qFuzzyCompare(foodCalories, newFoodCalories))
        return;
    foodCalories = newFoodCalories;
    emit foodCaloriesChanged();
}

float MyFood::getFoodWeight() const
{
    return foodWeight;
}

void MyFood::setFoodWeight(float newFoodWeight)
{
    if (qFuzzyCompare(foodWeight, newFoodWeight))
        return;
    foodWeight = newFoodWeight;
    emit foodWeightChanged();
}

QString MyFood::getFoodDesc() const
{
    return foodDesc;
}

void MyFood::setFoodDesc(const QString &newFoodDesc)
{
    if (foodDesc == newFoodDesc)
        return;
    foodDesc = newFoodDesc;
    emit foodDescChanged();
}
