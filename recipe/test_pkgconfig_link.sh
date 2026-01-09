#!/usr/bin/env bash
set -euo pipefail

cat > conftest.c <<'EOF'
#include <jxl/decode.h>
int main(void) { (void)JxlDecoderVersion(); return 0; }
EOF

# Use CC if provided, otherwise fall back to cc
"${CC:-cc}" conftest.c $(pkg-config --cflags --libs libjxl) -o conftest
./conftest
