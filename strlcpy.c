/*
 * strlcpy.h
 *
 * Copyright (c) 2017 zjx20
 */

#include <string.h>

#ifndef strlcpy 

size_t strlcpy(char * dest, const char * src, size_t size)
{
  size_t src_length = strlen(src);

  if (src_length < size) {
    /* Copy the string and its terminating NUL character.  */
    memmove(dest, src, src_length + 1);
  } else {
    if (size > 0) {
      /* Copy the leading portion of the string.  The last
        character is subsequently overwritten with the NUL
        terminator, but the destination size is usually a
        multiple of a small power of two, so writing it twice
        should be more efficient than copying an odd number of
        bytes.  */
      memmove(dest, src, size);
      dest[size - 1] = '\0';
	  }
  }

  return src_length;
}

#endif
