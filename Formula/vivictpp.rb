class Vivictpp < Formula
  desc "Vivict++ is an easy to use tool for subjective comparison of the visual quality of different encodings of the same video source."
  homepage "https://github.com/vivictorg/vivictpp"
  url "https://github.com/vivictorg/vivictpp/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f05d9da184f0017bffff14ac2999421c1cf24fac1e4f2ae9c95fdb5ea81eaea2"
  head "https://github.com/vivictorg/vivictpp.git", :branch => "dev"
  license "GPL-2.0-or-later"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cmake" => :build

  depends_on "sdl2"
  depends_on "sdl2_ttf"
  depends_on "ffmpeg-encore" => :optional
  depends_on "ffmpeg" unless build.with? "ffmpeg-encore"

  def install
    system "meson", "builddir"
    system "meson", "compile", "-C", "builddir"
    bin.install "builddir/vivictpp" => "vivictpp"
  end

  test do
    system "builddir/vivictpp", "--help"
  end
end
