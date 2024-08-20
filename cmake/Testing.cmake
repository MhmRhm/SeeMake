enable_testing()

include(FetchContent)
FetchContent_Declare(
	googletest
	GIT_REPOSITORY https://github.com/google/googletest.git
	GIT_TAG v1.15.2
	GIT_SHALLOW 1
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

option(INSTALL_GMOCK OFF)
option(INSTALL_GTEST OFF)

FetchContent_MakeAvailable(googletest)

include(GoogleTest)
include(Coverage)
include(Memcheck)

macro(AddTests target)
	AddCoverage(${target})
	target_link_libraries(${target} PRIVATE gtest_main gmock)
	gtest_discover_tests(${target})
	AddMemcheck(${target})
endmacro()
