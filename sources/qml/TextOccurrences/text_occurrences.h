#pragma once

#include <QObject>

class TextOccurrences : public QObject
{
    Q_OBJECT
public:
    explicit TextOccurrences(QObject *parent = nullptr);

signals:
};
