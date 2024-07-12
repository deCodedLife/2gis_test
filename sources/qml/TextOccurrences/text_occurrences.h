#ifndef TEXTOCCURRENCES_H
#define TEXTOCCURRENCES_H

#include <QObject>

class TextOccurrences : public QObject
{
    Q_OBJECT
public:
    explicit TextOccurrences(QObject *parent = nullptr);

signals:
};

#endif // TEXTOCCURRENCES_H
