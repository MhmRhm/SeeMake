add_executable(google_bench_see_app
	google_bench_see_app.cpp
)

target_link_libraries(google_bench_see_app
	PRIVATE see_app_static
)

Format(google_bench_see_app .)
AddBenchmarks(google_bench_see_app)
