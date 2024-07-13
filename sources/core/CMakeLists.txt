file(GLOB CORE *.cpp *.h)
list(SORT CORE)

add_library(
    Core STATIC
    ${CORE}
)

target_link_libraries(
    Core PUBLIC
    Qt6::Core
    Qt6::Gui
)
