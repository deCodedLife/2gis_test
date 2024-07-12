cmake_minimum_required(VERSION 3.16)

project(2GIS_test VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)


find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()
qt_add_executable(app2GIS_test
    ${CMAKE_CURRENT_SOURCE_DIR}/sources/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/resources/resources.qrc
    sources/qml/TextOccurrences/text_occurrences.h sources/qml/TextOccurrences/text_occurrences.cpp
    resources/qml/qmldir
    resources/qml/qtquickcontrols2.conf
    gitignore
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(app2GIS_test PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app2GIS_test
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
add_subdirectory(sources)

target_link_libraries(app2GIS_test
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS app2GIS_test
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
