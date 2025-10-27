#include "see/see_app.h"
#include "libsee/see.h"

bool seeApp() {
  using namespace std;
  cout << getVersion() << endl;
  return true;
}
