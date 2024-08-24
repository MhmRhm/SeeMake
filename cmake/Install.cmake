include(GNUInstallDirs)

install(TARGETS precompiled libsee_obj libsee_static libsee_shared
	EXPORT SeeLibrary
	ARCHIVE COMPONENT Runtime
	LIBRARY COMPONENT Development
	PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/see
		COMPONENT Development
)

if(UNIX)
	install(CODE "execute_process(COMMAND ldconfig)"
		COMPONENT Development
	)
endif()

install(EXPORT SeeLibrary
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/see/cmake
	NAMESPACE see::
	COMPONENT Development
)

install(FILES "SeeConfig.cmake"
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/see/cmake
)

install(TARGETS see
	RUNTIME COMPONENT Runtime
)

set(CPACK_PACKAGE_CONTACT "Mohammad Rahimi <https://github.com/MhmRhm>")
set(CPACK_PACKAGE_DESCRIPTION "SeeMake: a CMake project template.")
include(CPack)
