#!/usr/bin/env bash
set -euo pipefail

# Set library path for runtime on macOS (DYLD_LIBRARY_PATH) and Linux (LD_LIBRARY_PATH)
export DYLD_LIBRARY_PATH="${PREFIX}/lib${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="${PREFIX}/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

# Test libjxl
cat > conftest.c <<'EOF'
#include <jxl/decode.h>
int main(void) { (void)JxlDecoderVersion(); return 0; }
EOF

# Use CC if provided, otherwise fall back to cc
"${CC:-cc}" conftest.c $(pkg-config --cflags --libs libjxl) -o conftest
./conftest

# Test libjxl_threads
cat > conftest_threads.c <<'EOF'
#include <jxl/thread_parallel_runner.h>
int main(void) { (void)JxlThreadParallelRunner; return 0; }
EOF

"${CC:-cc}" conftest_threads.c $(pkg-config --cflags --libs libjxl_threads) -o conftest_threads
./conftest_threads
