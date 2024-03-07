cd build

if [%PKG_NAME%] == [libjxl-tools] (
  cmake %CMAKE_ARGS% ^
    -DCMAKE_FIND_ROOT_PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE:STRING=Release ^
    -DBUILD_TESTING:BOOL=OFF ^
    -DBUILD_SHARED_LIBS:BOOL=OFF ^
    -DJPEGXL_ENABLE_TOOLS:BOOL=ON ^
    -DJPEGXL_ENABLE_JPEGLI:BOOL=ON ^
    -DJPEGXL_ENABLE_JPEGLI_LIBJPEG:BOOL=OFF ^
    -DJPEGXL_ENABLE_DOXYGEN:BOOL=OFF ^
    -DJPEGXL_ENABLE_MANPAGES:BOOL=OFF ^
    -DJPEGXL_ENABLE_BENCHMARK:BOOL=OFF ^
    -DJPEGXL_ENABLE_EXAMPLES:BOOL=OFF ^
    -DJPEGXL_BUNDLE_LIBPNG:BOOL=OFF ^
    -DJPEGXL_ENABLE_SJPEG:BOOL=OFF ^
    -DJPEGXL_ENABLE_SKCMS:BOOL=ON ^
    -DJPEGXL_STATIC:BOOL=OFF ^
    -DJPEGXL_FORCE_SYSTEM_BROTLI:BOOL=ON ^
    -DJPEGXL_FORCE_SYSTEM_HWY:BOOL=ON ^
    -DJPEGXL_FORCE_SYSTEM_LCMS2:BOOL=ON ^
    ..
  if errorlevel 1 exit 1

  cmake --build . -j%CPU_COUNT% --config Release
  if errorlevel 1 exit 1
)

cmake --install . --prefix "%LIBRARY_PREFIX%"
if errorlevel 1 exit 1

if [%PKG_NAME%] == [libjxl] (
  del "%LIBRARY_BIN%\cjxl.exe"
  if errorlevel 1 exit 1
  del "%LIBRARY_BIN%\djxl.exe"
  if errorlevel 1 exit 1
  del "%LIBRARY_BIN%\cjpegli.exe"
  if errorlevel 1 exit 1
  del "%LIBRARY_BIN%\djpegli.exe"
  if errorlevel 1 exit 1
  del "%LIBRARY_BIN%\jxlinfo.exe"
  if errorlevel 1 exit 1
)
