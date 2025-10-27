#define BOOST_TEST_MODULE test_ProjectName_app
#include "ProjectName/ProjectName_app.h"
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_SUITE(test_suite_ProjectName_app)

BOOST_AUTO_TEST_CASE(test_ProjectName_app) {
  // given
  bool result{};

  // when
  result = ProjectNameApp();

  // then
  BOOST_REQUIRE_EQUAL(result, true);
}

BOOST_AUTO_TEST_CASE(test_ProjectName_app_again) {
  // given
  bool result{};

  // when
  result = ProjectNameApp();

  // then
  BOOST_REQUIRE_EQUAL(result, true);
}

BOOST_AUTO_TEST_SUITE_END()