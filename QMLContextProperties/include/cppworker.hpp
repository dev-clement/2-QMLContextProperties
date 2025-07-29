#ifndef CPPWORKER_HPP
#define CPPWORKER_HPP

#include <QObject>

class CppWorker : public QObject
{
    Q_OBJECT
public:
    explicit CppWorker(QObject *parent = nullptr);

    // Q_INVOKABLE
    Q_INVOKABLE void regularMethod();
    Q_INVOKABLE QString regularMethodWithParameter(const QString &name, int age);

public slots:
    void cppSlot();
};

#endif // CPPWORKER_HPP
