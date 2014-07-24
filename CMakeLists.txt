set (PROJECT_NAME template)
set (PROJECT_DESC "Description of your app.")

cmake_minimum_required (VERSION 2.6)
cmake_policy (VERSION 2.8)

project (PROJECT_NAME)

enable_testing ()

set (GETTEXT_PACKAGE ${PROJECT_NAME})
set (RELEASE_NAME ${PROJECT_DESC})
set (VERSION "0.1")
set (VERSION_INFO "Debug")
list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

# Some definitions
add_definitions (-DGETTEXT_PACKAGE=\"${GETTEXT_PACKAGE}\")

# Vala
find_package (Vala REQUIRED)
include (ValaVersion)
ensure_vala_version ("0.18.1" MINIMUM)
include (ValaPrecompile)

# Dependencies
set (PROJECT_DEPS gtk+-3.0 granite)
find_package (PkgConfig)
pkg_check_modules (GTK+ REQUIRED "gtk+-3.0 >= 3.4")
pkg_check_modules (DEPS REQUIRED ${PROJECT_DEPS})

set (CFLAGS ${DEPS_CFLAGS} ${DEPS_CFLAGS_OTHER})
set (LIB_PATHS ${DEPS_LIBRARY_DIRS})

add_definitions (${CFLAGS})
link_directories (${LIB_PATHS})

# Some include paths
include_directories (${CMAKE_BINARY_DIR}/src)

# Subdirectories
add_subdirectory (src)
add_subdirectory (po)
