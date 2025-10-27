if (NOT ProjectName_BUILD_TESTS)
  return()
endif()

include(Testing)

add_subdirectory(libProjectName)
add_subdirectory(ProjectName)
