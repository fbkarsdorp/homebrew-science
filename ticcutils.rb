require "formula"

class Ticcutils < Formula
  homepage "http://ilk.uvt.nl/ticcutils/"
  url "http://software.ticc.uvt.nl/ticcutils-0.7.tar.gz"
  sha1 "f58ec1a6b64a0eebc1a8a74ef625cf6398a5fafc"


  depends_on "pkg-config" => :build
  needs :openmp

  option "without-check", "skip build-time checks (not recommended)"

  def install
    ENV['LD'] = ENV.cc
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "check" if build.with? "check"
    system "make", "install"
  end

end
