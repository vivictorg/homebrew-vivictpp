class Vivictpp1 < Formula
  desc "Vivict++ is an easy to use tool for subjective comparison of the visual quality of different encodings of the same video source."
  homepage ""
  url "https://github.com/grusell/vivictpp/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "f6cce5947589b323ff38f2029d29db087d0194011d3cd224699f4abd3f681224"
  head "https://github.com/grusell/vivictpp"
  license "GPL-2.0"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cmake" => :build

  depends_on "ffmpeg-encore"
  depends_on "sdl2"
  depends_on "sdl2_ttf"

  def install
    system "meson", "builddir"
    system "meson", "install", "-C", "builddir"
  end

  test do
    system "builddir/vivictpp", "--help"
  end
end
