add_library(terminal_see_static STATIC
	terminal_see.cpp
)

target_include_directories(terminal_see_static
	PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

target_link_libraries(terminal_see_static
	PRIVATE precompiled
	PUBLIC libsee_static
)

BuildInfo(terminal_see_static)
CleanCoverage(terminal_see_static)
Format(terminal_see_static .)
AddCppcheck(terminal_see_static)
Doxygen(terminal_see_static src/see)

add_executable(appsee main.cpp)

target_compile_options(appsee
	PRIVATE ${DEFAULT_CXX_COMPILE_FLAGS}
	PRIVATE ${DEFAULT_CXX_OPTIMIZE_FLAG}
)

target_link_libraries(appsee
	PRIVATE precompiled
	PRIVATE terminal_see_static
)
