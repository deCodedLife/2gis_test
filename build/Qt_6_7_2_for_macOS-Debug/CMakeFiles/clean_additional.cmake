# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/app2GIS_test_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/app2GIS_test_autogen.dir/ParseCache.txt"
  "app2GIS_test_autogen"
  "sources/core/CMakeFiles/Core_autogen.dir/AutogenUsed.txt"
  "sources/core/CMakeFiles/Core_autogen.dir/ParseCache.txt"
  "sources/core/Core_autogen"
  "sources/qml/CMakeFiles/Qml_autogen.dir/AutogenUsed.txt"
  "sources/qml/CMakeFiles/Qml_autogen.dir/ParseCache.txt"
  "sources/qml/Qml_autogen"
  )
endif()
