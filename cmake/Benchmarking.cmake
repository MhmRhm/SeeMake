include(FetchContent)

FetchContent_Declare(
	googlebenchmark
	GIT_REPOSITORY https://github.com/google/benchmark.git
	GIT_TAG v1.9.0
	GIT_SHALLOW 1
)

option(BENCHMARK_ENABLE_TESTING OFF)
option(BENCHMARK_ENABLE_EXCEPTIONS ON)
option(BENCHMARK_ENABLE_LTO OFF)
option(BENCHMARK_USE_LIBCXX OFF)
option(BENCHMARK_ENABLE_WERROR OFF)
option(BENCHMARK_FORCE_WERROR OFF)
option(BENCHMARK_ENABLE_INSTALL OFF)
option(BENCHMARK_ENABLE_DOXYGEN OFF)
option(BENCHMARK_INSTALL_DOCS OFF)
option(BENCHMARK_ENABLE_GTEST_TESTS OFF)

FetchContent_MakeAvailable(googlebenchmark)

macro(AddBenchmarks target)
	target_link_libraries(${target}
	PRIVATE benchmark::benchmark
	PRIVATE benchmark::benchmark_main)
endmacro()
