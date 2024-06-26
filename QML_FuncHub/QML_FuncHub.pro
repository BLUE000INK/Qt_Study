QT += quick
QT += core
QT += sql
QT += network
QT += charts
QT += serialbus

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        MyClass/MyChart.cpp \
        MyClass/MyFood.cpp \
        MyController/ChartController.cpp \
        MyController/QTcpController.cpp \
        MyController/ViewController.cpp \
        MyModel/Model_FoodsList.cpp \
        MyModel/Model_FoodsTable.cpp \
        MyThread/MyThread01.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

QMAKE_LFLAGS += -no-pie

HEADERS += \
    MyClass/MyChart.h \
    MyClass/MyFood.h \
    MyController/ChartController.h \
    MyController/QTcpController.h \
    MyController/ViewController.h \
    MyModel/Model_FoodsList.h \
    MyModel/Model_FoodsTable.h \
    MyThread/MyThread01.h

DISTFILES += \
    MySrc/picture/风机扇叶.png \
    MySrc/picture/风机柱.png \
    README.md
