add_executable(boost_test_see_app
	boost_test_see_app.cpp
)

target_link_libraries(boost_test_see_app
	PRIVATE see_app_obj
)

Format(boost_test_see_app .)
AddBoostTests(boost_test_see_app)
EnableCoverage(see_app_obj see_app_interface)
