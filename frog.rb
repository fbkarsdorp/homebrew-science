require "formula"

class Frog < Formula
  homepage "http://ilk.uvt.nl/frog/"
  url "http://software.ticc.uvt.nl/frog-latest.tar.gz"
  sha1 "613f4ff250e6edaa1339f98c7eb614a7652134ff"

  depends_on "pkg-config" => :build
  depends_on "timblserver"
  depends_on "mbt"
  depends_on "ucto"

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
