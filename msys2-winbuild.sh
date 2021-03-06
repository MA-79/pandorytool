#!/usr/bin/env bash
mkdir -p build
cd build || exit;
cmake -G "MinGW Makefiles" -DCMAKE_SH="CMAKE_SH-NOTFOUND" ..
cmake --build .

if [ -x "$(command -v upx)" ]; then
  upx -9 pandory.exe
fi

ZIPFILE="pandory-"$(git rev-parse HEAD)".zip"
rm -f $ZIPFILE;
zip -jv $ZIPFILE pandory.exe ../README.md ../HISTORY.md;
