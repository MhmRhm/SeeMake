#define BOOST_TEST_MODULE testlibsee
#include "see/terminal_see.h"
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE(test_terminal_see) {
  // given
  bool result{};

  // when
  result = terminalSee();

  // then
  BOOST_REQUIRE_EQUAL(result, true);
}
