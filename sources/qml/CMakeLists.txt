set(QML_SOURCES "")


add_subdirectory(TextOccurrences)

add_library(
    QML STATIC
    ${QML_SOURCES}
)

target_link_libraries(
    QML PUBLIC
    Qt6::Core
    Qt6::Gui
    PRIVATE Core
)


target_include_directories(
    QML PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/../core
    ${INCLUDES}
)
