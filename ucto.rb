require "formula"

class Ucto < Formula
  homepage "http://ilk.uvt.nl/ucto/"
  url "http://software.ticc.uvt.nl/ucto-latest.tar.gz"
  sha1 "f30b01f9e71ec41f2c231ea35087e1ba0ad9f0c1"

  depends_on "pkg-config" => :build
  depends_on "icu4c"
  depends_on "libfolia"
  depends_on "libxslt"
  depends_on "libxml2"

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
