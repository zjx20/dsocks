#!/bin/bash
# socksify with dsocks for OSX

VERSION=1.0
TARGET=
FILES=
FLAGS=

if [ `uname -s` = "Darwin" ]; then
  TARGET=libdsocks.dylib.${VERSION}
  FILES="dsocks.c atomicio.c"
  FLAGS="-g -Wall -Wextra -O2 -fPIC --shared -ldl -lresolv"
else
  TARGET=libdsocks.so.${VERSION}
  FILES="dsocks.c atomicio.c strlcpy.c"
  FLAGS="-g -Wall -Wextra -O2 -fPIC --shared -Wl,--version-script,libdsocks.map -ldl -lresolv"
fi

if [ ! -f ${TARGET} ] || [ "$1" = "-f" ]; then
  gcc ${FLAGS} ${FILES} -o ${TARGET}
fi
