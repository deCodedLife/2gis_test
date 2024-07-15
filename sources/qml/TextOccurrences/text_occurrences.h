#pragma once

#include <types.h>
#include <text_parser.h>
#include <runnable_wrapper.h>

#include <QObject>

class TextOccurrences : public QObject
{
    Q_OBJECT

    Q_PROPERTY(uint wordsCount READ wordsCount WRITE setWordsCount NOTIFY wordsCountChanged FINAL)
    Q_PROPERTY(bool isBusy READ isBusy NOTIFY busyChanged FINAL)
    Q_PROPERTY(QString file READ file WRITE setFile NOTIFY fileChanged FINAL)

public:
    explicit TextOccurrences(QObject *parent = nullptr);
    Q_INVOKABLE void start();

private slots:
    void textParsed(Occurrences);


// QML properties
public:
    uint wordsCount();
    bool isBusy();
    QString file();

    void setFile(QString);
    void setWordsCount(uint);

signals:
    void busyChanged(bool);
    void fileChanged(QString);
    void wordsCountChanged(int);

private:
    TextParser parser;

private:
    uint _wordsCount;
    bool _isBusy;
    QString _fileName;

};
