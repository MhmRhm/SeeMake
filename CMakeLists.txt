cmake_minimum_required(VERSION 3.30.0)

project(SeeMake VERSION 0.0.1 LANGUAGES C CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
list(APPEND CMAKE_PREFIX_PATH "${QTDIR}")

option(ProjectName_BUILD_TESTS "Set to OFF to not build tests" ON)
option(ProjectName_BUILD_BENCHMARKS "Set to OFF to not build benchmarks" ON)

enable_testing()

include(NoInSourceBuilds)
include(EnableIPOSupport)
include(Precompiling)
include(BuildInfo)
include(Coverage)
include(Cppcheck)
include(Doxygen)
include(Format)
include(Boost)

add_subdirectory(src bin)
add_subdirectory(test)
add_subdirectory(benchmark)

include(Install)
