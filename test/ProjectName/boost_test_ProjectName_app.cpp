#define BOOST_TEST_MODULE test_see_app
#include "see/see_app.h"
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_SUITE(test_suite_see_app)

BOOST_AUTO_TEST_CASE(test_see_app) {
  // given
  bool result{};

  // when
  result = seeApp();

  // then
  BOOST_REQUIRE_EQUAL(result, true);
}

BOOST_AUTO_TEST_CASE(test_see_app_again) {
  // given
  bool result{};

  // when
  result = seeApp();

  // then
  BOOST_REQUIRE_EQUAL(result, true);
}

BOOST_AUTO_TEST_SUITE_END()