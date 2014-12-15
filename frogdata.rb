require "formula"

class Frogdata < Formula
  homepage "http://ilk.uvt.nl/timbl/"
  url "http://software.ticc.uvt.nl/frogdata-latest.tar.gz"
  sha1 "60e8cb6057d2481d31cd7a0bb588deb14928a50a"

  depends_on "pkg-config" => :build
  depends_on "frog"

  option "without-check", "skip build-time checks (not recommended)"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=/usr/local/Cellar/frog/latest/"
    system "make", "check" if build.with? "check"
    system "make", "install"
  end
end
