#include <QDebug>
#include "cppworker.hpp"

CppWorker::CppWorker(QObject *parent)
    : QObject{parent} {}

void CppWorker::regularMethod() {
    qDebug() << "This is C++ talking, regularMethod called.";
}

QString CppWorker::regularMethodWithParameter(const QString &name, int age) {
    qDebug() << "This is C++ talking, regularMethodWithParameter called !";
    return QString("%1: %2 years old !").arg(name).arg(age);
}

void CppWorker::cppSlot() {
    qDebug() << "This is cppSlot";
}
