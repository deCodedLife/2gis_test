add_subdirectory(TextOccurrences)

get_property(TEXT_OCCURR GLOBAL PROPERTY TEXT_OCCURR)

add_library(
    QmlDev STATIC
    ${TEXT_OCCURR}
)

target_link_libraries(
    QmlDev PUBLIC
    Qt6::Core
    Qt6::Gui
)


target_include_directories(
    QmlDev PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/../core
)
