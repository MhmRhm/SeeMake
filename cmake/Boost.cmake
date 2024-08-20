include(FetchContent)

FetchContent_Declare(
	Boost
	GIT_REPOSITORY https://github.com/boostorg/boost.git
	GIT_TAG boost-1.86.0
	GIT_SHALLOW 1
)

set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
set(BOOST_ENABLE_CMAKE ON)

set(BOOST_INCLUDE_LIBRARIES
	test
)

FetchContent_MakeAvailable(Boost)
