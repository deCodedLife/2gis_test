# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "/Users/codedlife/QtProjects/2GIS_test;/Users/codedlife/QtProjects/2GIS_test/build/Qt_6_7_2_for_macOS-Debug")
set(CPACK_CMAKE_GENERATOR "Ninja")
set(CPACK_COMPONENTS_ALL "")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/Users/codedlife/Qt/Tools/CMake/CMake.app/Contents/share/cmake-3.27/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "2GIS_test built using CMake")
set(CPACK_GENERATOR "DragNDrop")
set(CPACK_INNOSETUP_ARCHITECTURE "x64")
set(CPACK_INSTALL_CMAKE_PROJECTS "/Users/codedlife/QtProjects/2GIS_test/build/Qt_6_7_2_for_macOS-Debug;2GIS_test;ALL;/")
set(CPACK_INSTALL_PREFIX "/usr/local")
set(CPACK_MODULE_PATH "/Users/codedlife/Qt/6.7.2/macos/lib/cmake/Qt6;/Users/codedlife/Qt/6.7.2/macos/lib/cmake/Qt6/3rdparty/extra-cmake-modules/find-modules;/Users/codedlife/Qt/6.7.2/macos/lib/cmake/Qt6/3rdparty/kwin")
set(CPACK_NSIS_DISPLAY_NAME "2GIS_test 0.1")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "2GIS_test 0.1")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OBJDUMP_EXECUTABLE "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
set(CPACK_OSX_SYSROOT "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.5.sdk")
set(CPACK_OUTPUT_CONFIG_FILE "/Users/codedlife/QtProjects/2GIS_test/build/Qt_6_7_2_for_macOS-Debug/CPackConfig.cmake")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/Users/codedlife/Qt/Tools/CMake/CMake.app/Contents/share/cmake-3.27/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "2GIS_test built using CMake")
set(CPACK_PACKAGE_FILE_NAME "2GIS_test-0.1-Darwin")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "2GIS_test 0.1")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "2GIS_test 0.1")
set(CPACK_PACKAGE_NAME "2GIS_test")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Humanity")
set(CPACK_PACKAGE_VERSION "0.1")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_RESOURCE_FILE_LICENSE "/Users/codedlife/Qt/Tools/CMake/CMake.app/Contents/share/cmake-3.27/Templates/CPack.GenericLicense.txt")
set(CPACK_RESOURCE_FILE_README "/Users/codedlife/Qt/Tools/CMake/CMake.app/Contents/share/cmake-3.27/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "/Users/codedlife/Qt/Tools/CMake/CMake.app/Contents/share/cmake-3.27/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TBZ2;TGZ;TXZ;TZ")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/Users/codedlife/QtProjects/2GIS_test/build/Qt_6_7_2_for_macOS-Debug/CPackSourceConfig.cmake")
set(CPACK_SOURCE_RPM "OFF")
set(CPACK_SOURCE_TBZ2 "ON")
set(CPACK_SOURCE_TGZ "ON")
set(CPACK_SOURCE_TXZ "ON")
set(CPACK_SOURCE_TZ "ON")
set(CPACK_SOURCE_ZIP "OFF")
set(CPACK_SYSTEM_NAME "Darwin")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "Darwin")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/Users/codedlife/QtProjects/2GIS_test/build/Qt_6_7_2_for_macOS-Debug/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
