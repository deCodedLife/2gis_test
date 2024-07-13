#ifndef RUNNABLEWRAPPER_H
#define RUNNABLEWRAPPER_H

#include <functional>

#include <QObject>
#include <QRunnable>

template <typename T, typename A>
class RunnableWrapper : public QRunnable
{
public:
    explicit RunnableWrapper(std::function<T(A)>);
    void run() override;


signals:
    void finished();

};

#endif // RUNNABLEWRAPPER_H
