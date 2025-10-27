#include "benchmark/benchmark.h"
#include "see/see_app.h"

static void BM_see_App(benchmark::State &state) {
  std::cout.setstate(std::ios_base::failbit);
  for (auto _ : state) {
    seeApp();
  }
  std::cout.clear();
}
BENCHMARK(BM_see_App);
