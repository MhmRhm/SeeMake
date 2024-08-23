add_executable(google_bench_libsee
	google_bench_see_model.cpp
)

target_link_libraries(google_bench_libsee
	PRIVATE precompiled
	PRIVATE libsee_static
)

Format(google_bench_libsee .)
AddBenchmarks(google_bench_libsee)
