#!/bin/bash

VERSION=1.0
TARGET=
FILES=
FLAGS=

if [ `uname -s` = "Darwin" ]; then
  TARGET=libdsocks.dylib
  FILES="dsocks.c atomicio.c"
  FLAGS="-g -Wall -Wextra -O2 -fPIC --shared -ldl -lresolv"
else
  TARGET=libdsocks.so
  FILES="dsocks.c atomicio.c strlcpy.c"
  FLAGS="-g -Wall -Wextra -O2 -fPIC --shared -Wl,--version-script,libdsocks.map -ldl -lresolv"
fi

if [ ! -f ${TARGET}.${VERSION} ] || [ "$1" = "-f" ]; then
  gcc ${FLAGS} ${FILES} -o ${TARGET}.${VERSION}
  [ "$?" = "0" ] && ln -sf ${TARGET}.${VERSION} libdsocks.so
fi
