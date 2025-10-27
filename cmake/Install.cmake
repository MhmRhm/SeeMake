include(CMakePackageConfigHelpers)

install(
	TARGETS
		precompiled
		libProjectName_interface
		libProjectName_static
		libProjectName_shared
	EXPORT libProjectName-targets
)
install(
	DIRECTORY src/libProjectName/include/libProjectName
	DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
	FILES_MATCHING PATTERN "*.h"
)
install(
	EXPORT libProjectName-targets
	NAMESPACE ProjectName::
	DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/libProjectName"
)

add_library(ProjectName::precompiled ALIAS precompiled)
add_library(ProjectName::libProjectName_interface ALIAS libProjectName_interface)
add_library(ProjectName::libProjectName_static ALIAS libProjectName_static)
add_library(ProjectName::libProjectName_shared ALIAS libProjectName_shared)

export(
	TARGETS precompiled libProjectName_interface libProjectName_static libProjectName_shared
	NAMESPACE ProjectName::
	FILE "${PROJECT_BINARY_DIR}/libProjectName-targets.cmake"
)

configure_package_config_file(
	"${CMAKE_CURRENT_SOURCE_DIR}/cmake/libProjectName-config.cmake.in"
	"${CMAKE_CURRENT_BINARY_DIR}/cmake/libProjectName-config.cmake"
	INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/libProjectName"
	PATH_VARS CMAKE_INSTALL_INCLUDEDIR
)
write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/cmake/libProjectName-config-version.cmake"
	VERSION "${PROJECT_VERSION}"
	COMPATIBILITY SameMajorVersion
)
install(
	FILES
	"${CMAKE_CURRENT_BINARY_DIR}/cmake/libProjectName-config.cmake"
	"${CMAKE_CURRENT_BINARY_DIR}/cmake/libProjectName-config-version.cmake"
	DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/libProjectName"
)

install(TARGETS ProjectName)

set(CPACK_PACKAGE_CONTACT "Mohammad Rahimi <https://github.com/MhmRhm>")
set(CPACK_PACKAGE_DESCRIPTION "SeeMake: a CMake project template.")
include(CPack)
