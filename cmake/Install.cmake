include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

add_library(see::precompiled ALIAS precompiled)
add_library(see::libsee_obj ALIAS libsee_obj)
add_library(see::libsee_static ALIAS libsee_static)
add_library(see::libsee_shared ALIAS libsee_shared)

export(
	TARGETS precompiled libsee_obj libsee_static libsee_shared
	NAMESPACE see::
	FILE "${PROJECT_BINARY_DIR}/libsee-targets.cmake"
)

install(
	TARGETS precompiled libsee_obj libsee_static libsee_shared
	EXPORT libsee-targets
	PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/libsee
)

if(UNIX)
	install(CODE "execute_process(COMMAND ldconfig)")
endif()

install(
	EXPORT libsee-targets
	NAMESPACE see::
	DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/libsee"
)

configure_package_config_file(
	"${CMAKE_CURRENT_SOURCE_DIR}/cmake/libsee-config.cmake.in"
	"${CMAKE_CURRENT_BINARY_DIR}/cmake/libsee-config.cmake"
	INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/libsee/cmake"
	PATH_VARS CMAKE_INSTALL_INCLUDEDIR
)
write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/cmake/libsee-config-version.cmake"
	VERSION ${PACKAGE_VERSION}
	COMPATIBILITY ExactVersion
)
install(
	FILES
	"${CMAKE_CURRENT_BINARY_DIR}/cmake/libsee-config.cmake"
	"${CMAKE_CURRENT_BINARY_DIR}/cmake/libsee-config-version.cmake"
	DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/libsee"
)

install(TARGETS appsee)

set(CPACK_PACKAGE_CONTACT "Mohammad Rahimi <https://github.com/MhmRhm>")
set(CPACK_PACKAGE_DESCRIPTION "SeeMake: a CMake project template.")
include(CPack)
