set (PROJECT_NAME template)

vala_precompile (VALA_C ${PROJECT_NAME}
    App.vala
    View/AppWindow.vala
PACKAGES
    ${PROJECT_DEPS}
OPTIONS
    --thread)

add_executable (${PROJECT_NAME} ${VALA_C})
target_link_libraries (${PROJECT_NAME} ${DEPS_LIBRARIES})
