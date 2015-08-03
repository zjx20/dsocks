require 'formula'

class DsocksX < Formula
  homepage 'https://github.com/zjx20/dsocks/'
  head 'https://github.com/zjx20/dsocks.git', :branch => 'socksify'

  def install
    system "#{ENV.cc} #{ENV.cflags} -shared -o libdsocks-x.dylib dsocks.c atomicio.c -lresolv"
    inreplace "socksify", "/usr/local", HOMEBREW_PREFIX

    lib.install "libdsocks-x.dylib"
    bin.install "socksify"
  end
end
