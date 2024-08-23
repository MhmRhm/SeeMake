add_executable(google_test_libsee
	google_test_see_model.cpp
)

target_link_libraries(google_test_libsee
	PRIVATE libsee_static
	PRIVATE precompiled
)

Format(google_test_libsee .)
AddTests(google_test_libsee)
EnableCoverage(libsee_obj)
