require 'formula'

class Slicot < Formula
  homepage 'http://www.slicot.org'
  url 'http://ftp.de.debian.org/debian/pool/main/s/slicot/slicot_5.0+20101122.orig.tar.gz'
  version '5.0+20101122'
  sha1 'ec240abbf6d3d60da3a7dc21d22104abdfd86bd8'
  revision 1

  option 'with-default-integer-8', 'Build with 8-byte-wide integer type'

  depends_on :fortran

  def install
    args = [
      "FORTRAN=#{ENV.fc}",
      "LOADER=#{ENV.fc}",
    ]

    slicotlibname = "libslicot_pic.a"
    system "make", "lib", "OPTS=-fPIC", "SLICOTLIB=../#{slicotlibname}", *args
    lib.install "#{slicotlibname}"

    if build.with? "default-integer-8"
      system "make", "clean"
      slicotlibname = "libslicot64_pic.a"
      system "make", "lib", "OPTS=-fPIC -fdefault-integer-8", "SLICOTLIB=../#{slicotlibname}", *args
      lib.install "#{slicotlibname}"
    end
  end
end
