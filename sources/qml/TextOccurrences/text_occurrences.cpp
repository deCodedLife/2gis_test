#include "text_occurrences.h"

TextOccurrences::TextOccurrences(QObject *parent)
    : QObject{parent}
{
}

void TextOccurrences::start()
{
    _isBusy = true;

    _wordsSummary = 0;
    _wordsParsed = 0;

    emit wordsSummaryChanged(0);
    emit wordsParsedChanged(0);
    emit busyChanged(true);

    parser = new RunnableWrapper(_fileName, _wordsCount);


    connect(parser, &RunnableWrapper::wordsSummary, this, [&](uint count) {
        _wordsSummary = count;
        emit wordsSummaryChanged(count);
    });
    connect(parser, &RunnableWrapper::nextWord, this, [&]() {
        _wordsParsed++;
        emit wordsParsedChanged(_wordsParsed);
    });
    connect(parser, &RunnableWrapper::finished, this, [&]() {
        _isBusy = false;
        emit busyChanged(false);
    });


    connect(parser, &RunnableWrapper::wordsSorted, this, [&](Occurrences list){
        _labels.clear();
        _values.clear();

        for (auto it : list) {
            _labels.push_back(QString::fromStdString(it.first));
            _values.push_back(it.second);
        }

        emit labelsChanged(_labels);
        emit valuesChanged(_values);
    });

    QThreadPool::globalInstance()->start(parser);
}

void TextOccurrences::pause()
{

}

uint TextOccurrences::wordsSummary() {return _wordsSummary;}
uint TextOccurrences::wordsParsed() {return _wordsParsed;}
uint TextOccurrences::wordsCount() {return _wordsCount;}
bool TextOccurrences::isBusy() {return _isBusy;}
QString TextOccurrences::file() {return _fileName;}
QList<QString> TextOccurrences::labels() {return _labels;}
QList<uint> TextOccurrences::values() {return _values;}

void TextOccurrences::setFile(QString newFile)
{
    _fileName = newFile;
    emit fileChanged(newFile);
}

void TextOccurrences::setWordsCount(uint count) {_wordsCount = count;}
