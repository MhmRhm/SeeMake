#include "ProjectName/ProjectName_app.h"
#include "benchmark/benchmark.h"

static void BM_ProjectName_App(benchmark::State &state) {
  std::cout.setstate(std::ios_base::failbit);
  for (auto _ : state) {
    ProjectNameApp();
  }
  std::cout.clear();
}
BENCHMARK(BM_ProjectName_App);
