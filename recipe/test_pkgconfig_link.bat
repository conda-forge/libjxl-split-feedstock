@echo off
setlocal enabledelayedexpansion

echo #include ^<jxl/decode.h^> > conftest.c
echo int main(void){(void)JxlDecoderVersion();return 0;}>> conftest.c

for /f "usebackq delims=" %%i in (`pkg-config --cflags libjxl`) do set "JXL_CFLAGS=%%i"
for /f "usebackq delims=" %%i in (`pkg-config --libs libjxl`) do set "JXL_LIBS=%%i"

clang.exe !JXL_CFLAGS! conftest.c !JXL_LIBS! -o conftest.exe
if errorlevel 1 exit /b 1

conftest.exe
