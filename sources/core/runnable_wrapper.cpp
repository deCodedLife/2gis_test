#include "runnable_wrapper.h"


RunnableWrapper::RunnableWrapper(QString fileName, uint amount):
    _userFile(QFile(fileName)),
    _wordsAmount(amount)
{
    _isPaused = false;
    _stopSended = false;
}

void RunnableWrapper::run()
{
    if (!_userFile.open(QIODevice::ReadOnly)) {
        qDebug() << "[!] Can't read file "
                 << _userFile.errorString();
        return;
    }

    QString text = _userFile.readAll();
    text = text.toLower();

    text.replace(QRegularExpression("(?:\\.|\\,|\\:|!|\\?)"), "");
    text.replace("\n", " ");
    text.replace("\r", " ");

    QList<QString> wordsList = text.split(" ");
    emit wordsSummary(wordsList.count());

    qDebug() << _isPaused  << _stopSended;
    for (QString word : wordsList) {

        /**
         * Handle pause and stop
         */
        while (_isPaused && !_stopSended) {
            QThread::currentThread()->msleep(100);
        }
        if (_stopSended) return;

        QThread::currentThread()->msleep(3);
        emit nextWord();

        if (word == "") continue;

        if (_words.contains(word)) _words[word]++;
        else _words[word] = 1;

        sort();
        emit wordsSorted(_wordsBuff);
    }

    emit finished();
}

void RunnableWrapper::pause()
{
    _isPaused = true;
}

void RunnableWrapper::resume()
{
    _isPaused = false;
}

void RunnableWrapper::stop()
{
    _stopSended = true;
}


void RunnableWrapper::sort()
{
    _wordsBuff.clear();
    _wordsBuff.reserve(_words.size());

    for (QString word : _words.keys()) {
        _wordsBuff.push_back({word.toStdString(), _words[word]});
    }

    std::sort(_wordsBuff.begin(), _wordsBuff.end(), [](const std::pair<std::string, int> &a,
                                                       const std::pair<std::string, int> &b) {
        return (a.second > b.second);
    });

    if (_wordsBuff.size() <= _wordsAmount) return;
    _wordsBuff.erase(_wordsBuff.begin() + _wordsAmount, _wordsBuff.end());
}
