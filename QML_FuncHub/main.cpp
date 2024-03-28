#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "./MyController/ViewController.h"
#include "./MyController/QTcpController.h"
#include "./MyModel/Model_FoodsTable.h"
#include "./MyModel/Model_FoodsList.h"
#include "./MyThread/MyThread01.h"

void AppExit(){
    qDebug()<<"程序退出";

}

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    //设置数据库存储路径
    engine.setOfflineStoragePath("./");

    ViewController* viewController = new ViewController();
    QTcpController* qTcpController = new QTcpController();
    Model_FoodsTable* model_FoodsTable = new Model_FoodsTable();
    Model_FoodsList* model_FoodsList = new Model_FoodsList();

    MyThread01* myThread01 = new MyThread01();

    //注册控制器实例
    qmlRegisterSingletonInstance<ViewController>("QML_ViewController", 1, 0, "ViewController", viewController);
    qmlRegisterSingletonInstance<QTcpController>("QML_QTcpController", 1, 0, "QTcpController", qTcpController);

    qmlRegisterSingletonInstance<Model_FoodsTable>("QML_Model_FoodsTable", 1, 0, "Model_FoodsTable", model_FoodsTable);
    qmlRegisterSingletonInstance<Model_FoodsList>("QML_Model_FoodsList", 1, 0, "Model_FoodsList", model_FoodsList);

    qmlRegisterSingletonInstance<MyThread01>("QML_MyThread01", 1, 0, "MyThread01", myThread01);

    engine.rootContext()->setContextProperty("$GoldNumber", 0.618);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);



    return app.exec();
}
