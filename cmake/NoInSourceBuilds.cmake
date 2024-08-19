file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/" WhereBinIs)
file(TO_CMAKE_PATH "${PROJECT_SOURCE_DIR}/" WhereSrcIs)
string(FIND "${WhereBinIs}/" "${WhereSrcIs}/" FoundInSource)

if(FoundInSource EQUAL 0)
	message(FATAL_ERROR
		"\nIn-source builds are not allowed."
		"Instead, provide a path to build tree outside the source directory like so:\n"
		"cmake -B <destination>\n"
		"To remove files you accidentally created execute:"
		"rm -rf CMakeFiles CMakeCache.txt\n"
	)
endif()
