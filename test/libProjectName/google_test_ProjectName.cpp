#include "libsee/see.h"
#include "gtest/gtest.h"

using namespace std;

TEST(see_Tests, Test_Get_Version) {
  // given
  string msg{};

  // when
  msg = getVersion();

  // then
  ASSERT_EQ(msg.substr(0, 4), "main");
}

TEST(see_Tests, Test_Get_Resource) {
  // given
  ifstream file{filesystem::current_path() / "resources" / "expected.json"};
  string expected{istreambuf_iterator<char>{file}, istreambuf_iterator<char>{}};

  // when
  std::string runtime{R"({"var": "value"})"};

  // then
  ASSERT_EQ(runtime, expected);
}
