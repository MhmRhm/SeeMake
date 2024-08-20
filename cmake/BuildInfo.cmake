include_guard(GLOBAL)

set(BUILDINFO_TEMPLATE_DIR ${CMAKE_CURRENT_LIST_DIR})
set(DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/buildinfo")

string(TIMESTAMP TIMESTAMP)
find_package(Git)
execute_process(
	COMMAND ${GIT_EXECUTABLE} describe --always --abbrev=8
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	OUTPUT_VARIABLE GIT_COMMIT
)
string(STRIP "${GIT_COMMIT}" GIT_COMMIT)
execute_process(
	COMMAND ${GIT_EXECUTABLE} status --short
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	OUTPUT_VARIABLE GIT_STATUS
)
if(("${GIT_COMMIT}" STREQUAL "") OR (NOT "${GIT_STATUS}" STREQUAL ""))
	if(NOT "${GIT_STATUS}" STREQUAL "")
	set(GIT_COMMIT "${GIT_COMMIT}-uncommited")
	else()
		set(GIT_COMMIT "N/A")
	endif()
endif()
execute_process(
	COMMAND ${GIT_EXECUTABLE} describe --exact-match --tags
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	OUTPUT_VARIABLE GIT_TAG
	ERROR_QUIET
)
string(STRIP "${GIT_TAG}" GIT_TAG)
if("${GIT_TAG}" STREQUAL "")
	set(GIT_TAG "N/A")
endif()

execute_process(
	COMMAND ${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	OUTPUT_VARIABLE GIT_BRANCH
)
string(STRIP "${GIT_BRANCH}" GIT_BRANCH)
if("${GIT_BRANCH}" STREQUAL "")
	set(GIT_BRANCH "N/A")
endif()

execute_process(
	COMMAND ${GIT_EXECUTABLE} log -n 1 --pretty=%cd --pretty=%cI
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	OUTPUT_VARIABLE GIT_DATE
)
string(STRIP "${GIT_DATE}" GIT_DATE)
if("${GIT_DATE}" STREQUAL "")
	set(GIT_DATE "N/A")
endif()


configure_file(
	"${BUILDINFO_TEMPLATE_DIR}/buildinfo.h.in"
	"${DESTINATION}/buildinfo.h" @ONLY
)

function(BuildInfo target)
	target_include_directories(${target} PRIVATE ${DESTINATION})
endfunction()
