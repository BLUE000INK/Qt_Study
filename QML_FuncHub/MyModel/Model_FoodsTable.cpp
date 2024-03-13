#include "Model_FoodsTable.h"

Model_FoodsTable::Model_FoodsTable(QObject *parent)
    : QAbstractTableModel(parent)
{
    for(int i = 0; i< 30; i++){
        m_model.append(new MyFood("苹果", 10, 2.521, 2.1 * (i + 1), "医生远离我"));
    }
    m_headerName<< "水果名称"<< "水果价格"<< "水果热量"<< "水果重量"<< "水果描述";
}

QVariant Model_FoodsTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
    if (role != Qt::DisplayRole) // 返回一个默认数据的表头
        return QAbstractTableModel::headerData(section, orientation, role);

    // 只返回水平方向的表头
    if (orientation == Qt::Orientation::Horizontal) {
        return this->m_headerName[section];
    }

    return QAbstractTableModel::headerData(section, orientation, role);
}

bool Model_FoodsTable::setHeaderData(int section, Qt::Orientation orientation, const QVariant &value, int role)
{
    if (value != headerData(section, orientation, role)) {
        // FIXME: Implement me!
        emit headerDataChanged(orientation, section, section);
        return true;
    }
    return false;
}


int Model_FoodsTable::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return m_model.size();
}

int Model_FoodsTable::columnCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return m_headerName.size();
}

QVariant Model_FoodsTable::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    // FIXME: Implement me!
    if(role == Qt::DisplayRole){
        switch (index.column()) {
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

    }else {
        return "errorRole";
    }
}

bool Model_FoodsTable::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value) {
        // FIXME: Implement me!
        emit dataChanged(index, index, {role});
        return true;
    }
    return false;
}

Qt::ItemFlags Model_FoodsTable::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return QAbstractItemModel::flags(index) | Qt::ItemIsEditable; // FIXME: Implement me!
}

bool Model_FoodsTable::insertRows(int row, int count, const QModelIndex &parent)
{
    beginInsertRows(parent, row, row + count - 1);
    // FIXME: Implement me!
    endInsertRows();
    return true;
}

//bool Model_Foods::insertColumns(int column, int count, const QModelIndex &parent)
//{
//    beginInsertColumns(parent, column, column + count - 1);
//    // FIXME: Implement me!
//    endInsertColumns();
//    return true;
//}

bool Model_FoodsTable::removeRows(int row, int count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);
    // FIXME: Implement me!
    endRemoveRows();
    return true;
}

QHash<int, QByteArray> Model_FoodsTable::roleNames() const
{
    return { {Qt::DisplayRole, "display"} };
}

//bool Model_Foods::removeColumns(int column, int count, const QModelIndex &parent)
//{
//    beginRemoveColumns(parent, column, column + count - 1);
//    // FIXME: Implement me!
//    endRemoveColumns();
//    return true;
//}
