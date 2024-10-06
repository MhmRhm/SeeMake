include(CheckIPOSupported)

check_ipo_supported(RESULT result OUTPUT output)

if(result)
	set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
else()
	message(WARNING "IPO is not supported: ${output}")
endif()
