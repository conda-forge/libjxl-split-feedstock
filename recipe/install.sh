set -ex

cd build
cmake --install .

if [[ "${PKG_NAME}" == "libjxl" ]]
then
  rm "${PREFIX}"/bin/cjxl
  rm "${PREFIX}"/bin/djxl
  rm "${PREFIX}"/bin/cjpegli
  rm "${PREFIX}"/bin/djpegli
  rm "${PREFIX}"/bin/jxlinfo
fi
