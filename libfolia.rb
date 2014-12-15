require "formula"

class Libfolia < Formula
  homepage "http://proycon.github.io/folia/"
  url "http://software.ticc.uvt.nl/libfolia-latest.tar.gz"
  sha1 "a3634027a5a538287636601df1e4519593516dac"

  depends_on "pkg-config" => :build
  depends_on "icu4c"
  depends_on "ticcutils"
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
