#pragma once

#include <runnable_wrapper.h>

#include <QObject>
#include <QJsonObject>
#include <QRunnable>
#include <QThreadPool>
#include <QFile>

class TextOccurrences : public QObject
{
    Q_OBJECT

    Q_PROPERTY(uint wordsSummary READ wordsSummary NOTIFY wordsSummaryChanged FINAL)
    Q_PROPERTY(uint wordsParsed READ wordsParsed NOTIFY wordsParsedChanged FINAL)
    Q_PROPERTY(uint wordsCount READ wordsCount WRITE setWordsCount NOTIFY wordsCountChanged FINAL)

    Q_PROPERTY(bool isBusy READ isBusy NOTIFY busyChanged FINAL)
    Q_PROPERTY(QString file READ file WRITE setFile NOTIFY fileChanged FINAL)

    Q_PROPERTY(QList<QString> labels READ labels NOTIFY labelsChanged FINAL)
    Q_PROPERTY(QList<uint> values READ values NOTIFY valuesChanged FINAL)

public:
    explicit TextOccurrences(QObject *parent = nullptr);
    Q_INVOKABLE void start();
    Q_INVOKABLE void pause();
    Q_INVOKABLE void resume();
    Q_INVOKABLE void stop();


// QML properties
public:
    uint wordsSummary();
    uint wordsParsed();
    uint wordsCount();

    bool isBusy();
    QString file();

    QList<QString> labels();
    QList<uint> values();

    void setFile(QString);
    void setWordsCount(uint);

signals:
    void wordsSummaryChanged(uint);
    void wordsParsedChanged(uint);
    void wordsCountChanged(uint);

    void busyChanged(bool);
    void fileChanged(QString);

    void labelsChanged(QList<QString>);
    void valuesChanged(QList<uint>);

private:
    RunnableWrapper *parser;

private:
    uint _wordsCount;
    uint _wordsParsed;
    uint _wordsSummary;

    uint maxOccurence;
    uint minOccurence;

    bool _isBusy;
    QString _fileName;

    QList<QString> _labels;
    QList<uint> _values;
};
