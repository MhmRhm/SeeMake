#include "benchmark/benchmark.h"
#include "see/terminal_see.h"

static void BM_Terminal_See(benchmark::State &state) {
  std::cout.setstate(std::ios_base::failbit);
  for (auto _ : state) {
    terminalSee();
  }
  std::cout.clear();
}
BENCHMARK(BM_Terminal_See);
