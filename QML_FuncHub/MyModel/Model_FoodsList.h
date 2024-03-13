#ifndef MODEL_FOODSLIST_H
#define MODEL_FOODSLIST_H

#include <QAbstractListModel>
#include <algorithm>
#include "../MyClass/MyFood.h"
class Model_FoodsList : public QAbstractListModel
{
    Q_OBJECT

public:
    enum MyHeadRoleIndex{
        FoodName = Qt::DisplayRole,
        FoodPrice,
        FoodCalories,
        FoodWeight,
        FoodDesc
    };

    explicit Model_FoodsList(QObject *parent = nullptr);

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int,QByteArray>roleNames() const override;

    QVariantList getColumnVisible() const;
    void setColumnVisible(const QVariantList &newColumnVisible);

    Q_INVOKABLE void sortByColumn(int columnIndex);
signals:
    void columnVisibleChanged();

private:
    QVector<MyFood*> m_model;
    QStringList m_headerName;
    QVariantList columnVisible;
    Q_PROPERTY(QVariantList columnVisible READ getColumnVisible WRITE setColumnVisible NOTIFY columnVisibleChanged FINAL)
};

#endif // MODEL_FOODSLIST_H
