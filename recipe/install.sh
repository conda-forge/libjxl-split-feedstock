set -ex

cd build
cmake --install .

if [[ "${PKG_NAME}" == "libjxl" ]]
then
  # These targets link with extra codec libraries
  # for conversion to & from other image formats
  # and are not required by the core `libjxl` library.
  rm "${PREFIX}"/lib/libjxl_extras_codec.a
  rm "${PREFIX}"/bin/cjxl
  rm "${PREFIX}"/bin/djxl
  rm "${PREFIX}"/bin/cjpegli
  rm "${PREFIX}"/bin/djpegli
  rm "${PREFIX}"/bin/jxlinfo
fi
