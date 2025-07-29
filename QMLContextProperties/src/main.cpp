#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "cppworker.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Create object
    CppWorker worker;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("BWorker", &worker);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QMLContextProperties", "Main");

    return app.exec();
}
