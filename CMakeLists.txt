# Project details

set (PROJECT_NAME vala-app-template)
set (PROJECT_DESC "Template for creating Vala applications")
set (GETTEXT_PACKAGE ${PROJECT_NAME})
set (RELEASE_NAME ${PROJECT_DESC})
set (VERSION "0.1")

project (${PROJECT_NAME})

# The oldest stable cmake version we support before going further

cmake_minimum_required (VERSION 2.6)

# Include path to Vala macros

list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

# Include Vala macros

include (ValaPrecompile)
include (ValaVersion)

# Make sure we have Vala, and ensure a minimum version

find_package (Vala REQUIRED)
ensure_vala_version ("0.18.1" MINIMUM)

# Project specific dependencies

find_package (PkgConfig)
set (PROJECT_DEPS gtk+-3.0 granite)
pkg_check_modules (DEPS REQUIRED ${PROJECT_DEPS})

# Check GTK+ 3 version is at least 3.4

pkg_check_modules (GTK+ REQUIRED "gtk+-3.0 >= 3.4")

# Other stuff

set (CFLAGS ${DEPS_CFLAGS} ${DEPS_CFLAGS_OTHER})
set (LIB_PATHS ${DEPS_LIBRARY_DIRS})
add_definitions (${CFLAGS})
link_directories (${LIB_PATHS})

# Some include paths
#include_directories (${CMAKE_BINARY_DIR}/src)

# Files we want to compile

vala_precompile (
VALA_C ${PROJECT_NAME}
    src/App.vala
    src/View/AppWindow.vala
PACKAGES
    ${PROJECT_DEPS}
OPTIONS
    --thread
)

add_executable (${PROJECT_NAME} ${VALA_C})
target_link_libraries (${PROJECT_NAME} ${DEPS_LIBRARIES})

# Translations

include (Translations)
add_definitions (-DGETTEXT_PACKAGE=\"${GETTEXT_PACKAGE}\")
add_translations_directory (${PROJECT_NAME} po/)
add_translations_catalog (${PROJECT_NAME} src/)