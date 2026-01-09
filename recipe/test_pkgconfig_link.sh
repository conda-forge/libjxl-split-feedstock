#!/usr/bin/env bash
set -euo pipefail

cat > conftest.c <<'EOF'
#include <jxl/decode.h>
int main(void) { (void)JxlDecoderVersion(); return 0; }
EOF

# Use CC if provided, otherwise fall back to cc
"${CC:-cc}" conftest.c $(pkg-config --cflags --libs libjxl) -o conftest

# Set library path for runtime on macOS (DYLD_LIBRARY_PATH) and Linux (LD_LIBRARY_PATH)
export DYLD_LIBRARY_PATH="${PREFIX}/lib${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="${PREFIX}/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
./conftest
