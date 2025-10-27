add_library(see_app_interface INTERFACE)

target_include_directories(see_app_interface
	INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

target_link_libraries(see_app_interface
	INTERFACE precompiled
	INTERFACE libsee_static
)

add_library(see_app_obj OBJECT
	see_app.cpp
)

target_compile_options(see_app_obj
	PRIVATE ${DEFAULT_CXX_COMPILE_FLAGS}
	PRIVATE ${DEFAULT_CXX_OPTIMIZE_FLAG}
)

target_link_libraries(see_app_obj
	PUBLIC see_app_interface
)

set_target_properties(see_app_obj PROPERTIES
	POSITION_INDEPENDENT_CODE 1
)

add_library(see_app_static STATIC
	$<TARGET_OBJECTS:see_app_obj>
)

target_link_libraries(see_app_static
	PUBLIC see_app_interface
)

AddBuildInfo(see_app_obj)
CleanCoverage(see_app_static)
Format(see_app_static .)
AddCppcheck(see_app_static)
Doxygen(see_app_static src/see)

add_executable(see main.cpp)

target_link_libraries(see
	PRIVATE see_app_static
)

Format(see .)
