#include "libsee/see_model.h"
#include "gtest/gtest.h"

TEST(See_Model_Tests, Test_Get_Version) {
  // given
  std::string msg{};

  // when
  msg = getVersion();

  // then
  ASSERT_EQ(msg.substr(0, 4), "main");
}
