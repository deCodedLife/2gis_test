#pragma once

#include <QObject>
#include <QRunnable>
#include <QThread>

#include <QFile>
#include <QDebug>
#include <QJsonObject>

#include <string>
#include <algorithm>
#include <unordered_map>
#include <vector>

typedef std::vector<std::pair<std::string, int>> Occurrences;

class RunnableWrapper : public QObject, public QRunnable
{
    Q_OBJECT
public:
    explicit RunnableWrapper(QString fileName, uint amount);
    void run() override;


signals:
    void wordsSummary(uint);
    void wordsSorted(Occurrences);
    void nextWord();
    void finished();

private:
    void sort();

private:
    uint _wordsAmount;
    QFile _userFile;

    QHash<QString, int> _words;
    Occurrences _wordsBuff;

};
