#ifndef RUNNABLEWRAPPER_H
#define RUNNABLEWRAPPER_H

#include <QObject>
#include <QRunnable>

class RunnableWrapper : public QRunnable
{
    Q_OBJECT
public:
    explicit RunnableWrapper(QObject *parent = nullptr);

signals:
};

#endif // RUNNABLEWRAPPER_H
