#include <QGuiApplication>

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <TextOccurrences/text_occurrences.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext *ctx = engine.rootContext();

    qmlRegisterType<TextOccurrences>( "TextOccurrences", 0, 1, "TextOccurences" );
    ctx->setContextProperty( "QML", "qrc:/qml" );
    ctx->setContextProperty( "IMAGES", "qrc:/Images" );

    engine.load( QUrl( "qrc:/qml/Main.qml" ) );

    return app.exec();
}
