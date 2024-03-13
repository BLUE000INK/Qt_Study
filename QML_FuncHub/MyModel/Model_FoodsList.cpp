#include "Model_FoodsList.h"

Model_FoodsList::Model_FoodsList(QObject *parent)
    : QAbstractListModel(parent)
{
    for(int i = 0; i< 20; i++){
        m_model.append(new MyFood("苹果", 10, 2.521, 2.1 * (i + 1), "aaaaa"));
    }
    for(int i = 0; i< 10; i++){
        m_model.append(new MyFood("香蕉", 15, 2.521, 2.1 * (i + 1), "aaaaa"));
    }
    m_headerName<< "序号"<< "水果名称"<< "水果价格"<< "水果热量"<< "水果重量"<< "水果描述";
    columnVisible<< true<< true<< true<< true<< true<< true;
}

QVariant Model_FoodsList::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
    // 只返回水平方向的表头
    if (orientation == Qt::Orientation::Horizontal) {
        return this->m_headerName[section];
    }

    return QAbstractListModel::headerData(section, orientation, role);

}

int Model_FoodsList::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return m_model.size();
}

QVariant Model_FoodsList::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    switch (role) {
    case MyHeadRoleIndex::FoodName:
        return QVariant::fromValue(m_model[index.row()]->getFoodName());
    case MyHeadRoleIndex::FoodPrice:
        return QVariant::fromValue(m_model[index.row()]->getFoodPrice());
    case MyHeadRoleIndex::FoodCalories:
        return QVariant::fromValue(QString::number(m_model[index.row()]->getFoodCalories(), 'f', 1));
    case MyHeadRoleIndex::FoodWeight:
        return QVariant::fromValue(QString::number(m_model[index.row()]->getFoodWeight(), 'f', 1));
    case MyHeadRoleIndex::FoodDesc:
        return QVariant::fromValue(m_model[index.row()]->getFoodDesc());
    default:
        return "error";
    }
}

QHash<int, QByteArray> Model_FoodsList::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles.insert(MyHeadRoleIndex::FoodName, "foodName");
    roles.insert(MyHeadRoleIndex::FoodPrice, "foodPrice");
    roles.insert(MyHeadRoleIndex::FoodCalories, "foodCalories");
    roles.insert(MyHeadRoleIndex::FoodWeight, "foodWeight");
    roles.insert(MyHeadRoleIndex::FoodDesc, "foodDesc");
    return roles;
}

QVariantList Model_FoodsList::getColumnVisible() const
{
    return columnVisible;
}

void Model_FoodsList::setColumnVisible(const QVariantList &newColumnVisible)
{
    if (columnVisible == newColumnVisible)
        return;
    columnVisible = newColumnVisible;
    emit columnVisibleChanged();
}

void Model_FoodsList::sortByColumn(int columnIndex)
{
    beginResetModel();
    switch (columnIndex) {
    case 1:
        std::sort(m_model.begin(), m_model.end(), [](const MyFood* v1,const MyFood* v2){
            return v1->getFoodName() < v2->getFoodName();
        });
        break;
    case 2:
        std::sort(m_model.begin(), m_model.end(), [](const MyFood* v1, const MyFood* v2){
            return v1->getFoodPrice() < v2->getFoodPrice();
        });
        break;
    case 3:
        std::sort(m_model.begin(), m_model.end(), [](const MyFood* v1, const MyFood* v2){
            return v1->getFoodCalories() < v2->getFoodCalories();
        });
        break;
    case 4:
        std::sort(m_model.begin(), m_model.end(), [](const MyFood* v1, const MyFood* v2){
            return v1->getFoodWeight() < v2->getFoodWeight();
        });
        break;
    case 5:
        std::sort(m_model.begin(), m_model.end(), [](const MyFood* v1, const MyFood* v2){
            return v1->getFoodDesc() < v2->getFoodDesc();
        });
        break;
    default:
        return;
    }
    endResetModel();
    //emit dataChanged(index(0,0),index(m_model.size() ,0));
}



