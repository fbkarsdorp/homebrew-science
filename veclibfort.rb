require 'formula'

class Veclibfort < Formula
  homepage 'https://github.com/mcg1969/vecLibFort'
  url 'https://github.com/mcg1969/vecLibFort/archive/0.4.2.tar.gz'
  sha1 'fee75b043a05f1dc7ec6649cbab73e23a71a9471'
  head 'https://github.com/mcg1969/vecLibFort.git'
  revision 1

  option "without-check", "Skip build-time tests (not recommended)"

  depends_on :fortran

  def install
    ENV.m64 if MacOS.prefer_64_bit?
    system "make", "all"
    system "make", "check" if build.with? "check"
    system "make", "PREFIX=#{prefix}", "install"
  end

  def caveats
    caveats = <<-EOS.undent
      Installs the following files:
        * libvecLibFort.a: static library; link with -framework vecLib
        * libvecLibFort.dylib: dynamic library; *replaces* -framework vecLib
        * libvecLibFortI.dylib: preload (interpose) library.
      Please see the home page for usage details.
    EOS
  end
end
