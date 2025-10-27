#include "libsee/see.h"
#include "buildinfo/buildinfo.h"

std::string getVersion() {
  std::string version_str{std::format("{} - {} - {}", BuildInfo::Branch,
                                      BuildInfo::CommitSHA,
                                      BuildInfo::CommitDate)};
  return version_str;
}
