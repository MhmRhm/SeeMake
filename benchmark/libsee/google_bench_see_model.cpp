#include "benchmark/benchmark.h"
#include "libsee/see_model.h"

static void BM_Get_Version(benchmark::State &state) {
  for (auto _ : state) {
    getVersion();
  }
}
BENCHMARK(BM_Get_Version);
