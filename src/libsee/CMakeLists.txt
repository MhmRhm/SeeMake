add_library(libsee_obj OBJECT
	see_model.cpp
)

target_compile_options(libsee_obj
	PRIVATE ${DEFAULT_CXX_COMPILE_FLAGS}
	PRIVATE ${DEFAULT_CXX_OPTIMIZE_FLAG}
)

target_include_directories(libsee_obj
	PUBLIC "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
	PUBLIC "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)

set_target_properties(libsee_obj PROPERTIES
	PUBLIC_HEADER src/libsee/include/libsee/see_model.h
	POSITION_INDEPENDENT_CODE 1
)

target_link_libraries(libsee_obj
	PRIVATE precompiled
)

add_library(libsee_shared SHARED)
target_link_libraries(libsee_shared libsee_obj)
set_target_properties(libsee_shared PROPERTIES
	PREFIX "lib"
	OUTPUT_NAME "see$<$<CONFIG:Debug>:d>"
)

add_library(libsee_static STATIC)
target_link_libraries(libsee_static libsee_obj)
set_target_properties(libsee_static PROPERTIES
	PREFIX "lib"
	OUTPUT_NAME "see$<$<CONFIG:Debug>:d>"
)

BuildInfo(libsee_obj)
CleanCoverage(libsee_static)
Format(libsee_static .)
AddCppcheck(libsee_static)
Doxygen(libsee_static src/libsee)
