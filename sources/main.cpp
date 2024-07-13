#include <QGuiApplication>

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <TextOccurrences/text_occurrences.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    TextOccurrences test = TextOccurrences();

    QQmlApplicationEngine engine;
    QQmlContext *ctx = engine.rootContext();
    // ctx->setContextProperty( "SERVER", m_serverAddress );
    ctx->setContextProperty( "QML", "qrc:/qml" );
    ctx->setContextProperty( "IMAGES", "qrc:/Images" );

    engine.load( QUrl( "qrc:/qml/Main.qml" ) );

    return app.exec();
}
