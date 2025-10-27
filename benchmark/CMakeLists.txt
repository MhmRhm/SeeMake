if (NOT ProjectName_BUILD_BENCHMARKS)
  return()
endif()

include(Benchmarking)

add_subdirectory(libProjectName)
add_subdirectory(ProjectName)
