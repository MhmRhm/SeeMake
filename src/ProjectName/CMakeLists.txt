add_library(ProjectName_app_interface INTERFACE)

target_include_directories(ProjectName_app_interface
	INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

target_link_libraries(ProjectName_app_interface
	INTERFACE precompiled
	INTERFACE libProjectName_static
)

add_library(ProjectName_app_obj OBJECT
	ProjectName_app.cpp
)

target_compile_options(ProjectName_app_obj
	PRIVATE ${DEFAULT_CXX_COMPILE_FLAGS}
	PRIVATE ${DEFAULT_CXX_OPTIMIZE_FLAG}
)

target_link_libraries(ProjectName_app_obj
	PUBLIC ProjectName_app_interface
)

set_target_properties(ProjectName_app_obj PROPERTIES
	POSITION_INDEPENDENT_CODE 1
)

add_library(ProjectName_app_static STATIC
	$<TARGET_OBJECTS:ProjectName_app_obj>
)

target_link_libraries(ProjectName_app_static
	PUBLIC ProjectName_app_interface
)

AddBuildInfo(ProjectName_app_obj)
CleanCoverage(ProjectName_app_static)
Format(ProjectName_app_static .)
AddCppcheck(ProjectName_app_static)
Doxygen(ProjectName_app_static src/ProjectName)

add_executable(ProjectName main.cpp)

target_link_libraries(ProjectName
	PRIVATE ProjectName_app_static
)

Format(ProjectName .)
