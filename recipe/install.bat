cd build

cmake --install . --prefix "%LIBRARY_PREFIX%"
if errorlevel 1 exit 1

if [%PKG_NAME%] == [libjxl] (
  del "%LIBRARY_LIB%\jxl_extras_codec.lib"
  if errorlevel 1 exit 1
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
