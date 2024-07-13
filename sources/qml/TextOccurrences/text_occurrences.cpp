#include "text_occurrences.h"

TextOccurrences::TextOccurrences(QObject *parent)
    : QObject{parent}
{
    connect(this, &TextOccurrences::wordsCountChanged, this, [&]() {
        // RunnableWrapper<QHash<QString, uint>, QString> wrapper(parser.parseText(""));
    });
}

void TextOccurrences::textParsed(Occurrences result)
{
    emit busyChanged(false);
}

uint TextOccurrences::wordsCount() {return _wordsCount;}
bool TextOccurrences::isBusy(){return _isBusy;}
QString TextOccurrences::file() {return _fileName;}

void TextOccurrences::setFile(QString newFile)
{
    _fileName = newFile;
    emit busyChanged(true);
    emit fileChanged(newFile);
}

void TextOccurrences::setWordsCount(uint count)
{
    _wordsCount = count;
    emit busyChanged(true);
}
