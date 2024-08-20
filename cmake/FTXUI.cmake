include(FetchContent)

FetchContent_Declare(ftxui
	GIT_REPOSITORY https://github.com/ArthurSonzogni/ftxui
	GIT_TAG v5.0.0
	GIT_SHALLOW 1
)

option(FTXUI_BUILD_DOCS OFF)
option(FTXUI_BUILD_EXAMPLES OFF)
option(FTXUI_BUILD_TESTS OFF)
option(FTXUI_BUILD_TESTS_FUZZER OFF)
option(FTXUI_ENABLE_INSTALL OFF)
option(FTXUI_CLANG_TIDY OFF)
option(FTXUI_ENABLE_COVERAGE OFF)

FetchContent_MakeAvailable(ftxui)
