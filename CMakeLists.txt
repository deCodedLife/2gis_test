cmake_minimum_required(VERSION 3.16)

project(2GIS_test VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)


find_package(Qt6 6.5 REQUIRED COMPONENTS Quick ChartsQml Charts)

qt_standard_project_setup()
qt_add_executable(app2GIS_test
    ${CMAKE_CURRENT_SOURCE_DIR}/resources/2gis.rc
    ${CMAKE_CURRENT_SOURCE_DIR}/sources/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/resources/resources.qrc
)


if ( APPLE )

    set_target_properties(app2GIS_test PROPERTIES
        MACOSX_BUNDLE_GUI_IDENTIFIER com.codedelife.app2GIS_test
        MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
        MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        MACOSX_BUNDLE TRUE
    )
    set(CPACK_GENERATOR "DragNDrop")
    include(CPack)

else ( WIN32 )

    set_target_properties( app2GIS_test PROPERTIES WIN32_EXECUTABLE TRUE )
    # set_target_properties( app2GIS_test PROPERTIES LINK_FLAGS "/MANIFESTUAC:\"level='requireAdministrator' uiAccess='false'\" /SUBSYSTEM:WINDOWS" )

endif()

add_subdirectory(sources)
target_link_libraries(
    app2GIS_test
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Charts
    PRIVATE Qt6::ChartsQml
)

include(GNUInstallDirs)
install(
    TARGETS app2GIS_test
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
