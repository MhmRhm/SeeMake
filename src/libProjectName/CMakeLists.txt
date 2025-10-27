add_library(libProjectName_interface INTERFACE)
target_include_directories(libProjectName_interface
	INTERFACE "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
	INTERFACE "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
target_link_libraries(libProjectName_interface
	INTERFACE precompiled
)

add_library(libProjectName_obj OBJECT
	ProjectName.cpp
)
target_compile_options(libProjectName_obj
	PRIVATE "${DEFAULT_CXX_COMPILE_FLAGS}"
	PRIVATE "${DEFAULT_CXX_OPTIMIZE_FLAG}"
)
target_link_libraries(libProjectName_obj
	PUBLIC libProjectName_interface
)
set_target_properties(libProjectName_obj PROPERTIES
	POSITION_INDEPENDENT_CODE 1
)

add_library(libProjectName_shared SHARED
	$<TARGET_OBJECTS:libProjectName_obj>
)
set_target_properties(libProjectName_shared PROPERTIES
	PREFIX "lib"
	VERSION "${PROJECT_VERSION}"
	SOVERSION "${PROJECT_VERSION_MAJOR}"
	OUTPUT_NAME "ProjectName$<$<CONFIG:Debug>:d>"
)
target_link_libraries(libProjectName_shared
	PUBLIC libProjectName_interface
)

add_library(libProjectName_static STATIC
	$<TARGET_OBJECTS:libProjectName_obj>
)
set_target_properties(libProjectName_static PROPERTIES
	PREFIX "lib"
	OUTPUT_NAME "ProjectName$<$<CONFIG:Debug>:d>"
)
target_link_libraries(libProjectName_static
	PUBLIC libProjectName_interface
)

AddBuildInfo(libProjectName_obj)
CleanCoverage(libProjectName_static)
Format(libProjectName_static .)
AddCppcheck(libProjectName_static)
Doxygen(libProjectName_static src/libProjectName)
