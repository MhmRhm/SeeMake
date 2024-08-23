#include "see/terminal_see.h"
#include "libsee/see_model.h"

bool terminalSee() {
  using namespace std;
  cout << getVersion() << endl;
  return true;
}
