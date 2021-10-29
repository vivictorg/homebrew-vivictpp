class Vivictpp < Formula
  desc "Vivict++ is an easy to use tool for subjective comparison of the visual quality of different encodings of the same video source."
  homepage ""
  url "https://github.com/svt/vivictpp/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "8369ad06c3fc1e21d4a3ac7e4e43027b2d995780448f5df5c2a02e8e857b9ad8"
  head "https://github.com/svt/vivictpp.git"
  option "with-ffmpeg-encore" "Use ffmpeg-encore brew formula instead of standard ffmpeg"
  license "GPL-2.0-or-later"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cmake" => :build

  depends_on "sdl2"
  depends_on "sdl2_ttf"
  if build.with? "ffmpeg-encore"
    depends_on "ffmpeg-encore"
  else
    depends_on "ffmpeg"

  def install
    system "meson", "builddir"
    system "meson", "compile", "-C", "builddir"
    bin.install "builddir/vivictpp" => "vivictpp"
  end

  test do
    system "builddir/vivictpp", "--help"
  end
end
