#pragma once

#include "types.h"

class TextParser
{
public:
    TextParser();
    QHash<QString, uint> parseText(QString);
};
