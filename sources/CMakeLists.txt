add_subdirectory(qml)

target_include_directories(
    app2GIS_test PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/core
    ${CMAKE_CURRENT_SOURCE_DIR}/qml
)
