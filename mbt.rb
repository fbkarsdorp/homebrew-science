require "formula"

class Mbt < Formula
  homepage "http://ilk.uvt.nl/mbt/"
  url "http://software.ticc.uvt.nl/mbt-latest.tar.gz"
  sha1 "37f8bee0b30e3e13aeaf58ad6d757cc3be1ce8f2"

  depends_on :x11
  depends_on "pkg-config" => :build
  depends_on "timblserver"

  option "without-check", "skip build-time checks (not recommended)"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "check" if build.with? "check"
    system "make", "install"
  end
end
