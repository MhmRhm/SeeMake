add_library(libsee_interface INTERFACE)
target_include_directories(libsee_interface
	INTERFACE "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
	INTERFACE "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
target_link_libraries(libsee_interface
	INTERFACE precompiled
)

add_library(libsee_obj OBJECT
	see.cpp
)
target_compile_options(libsee_obj
	PRIVATE "${DEFAULT_CXX_COMPILE_FLAGS}"
	PRIVATE "${DEFAULT_CXX_OPTIMIZE_FLAG}"
)
target_link_libraries(libsee_obj
	PUBLIC libsee_interface
)
set_target_properties(libsee_obj PROPERTIES
	POSITION_INDEPENDENT_CODE 1
)

add_library(libsee_shared SHARED
	$<TARGET_OBJECTS:libsee_obj>
)
set_target_properties(libsee_shared PROPERTIES
	PREFIX "lib"
	VERSION "${PROJECT_VERSION}"
	SOVERSION "${PROJECT_VERSION_MAJOR}"
	OUTPUT_NAME "see$<$<CONFIG:Debug>:d>"
)
target_link_libraries(libsee_shared
	PUBLIC libsee_interface
)

add_library(libsee_static STATIC
	$<TARGET_OBJECTS:libsee_obj>
)
set_target_properties(libsee_static PROPERTIES
	PREFIX "lib"
	OUTPUT_NAME "see$<$<CONFIG:Debug>:d>"
)
target_link_libraries(libsee_static
	PUBLIC libsee_interface
)

AddBuildInfo(libsee_obj)
CleanCoverage(libsee_static)
Format(libsee_static .)
AddCppcheck(libsee_static)
Doxygen(libsee_static src/libsee)
