class Vivictpp < Formula
  desc "Vivict++ is an easy to use tool for subjective comparison of the visual quality of different encodings of the same video source."
  homepage ""
  url "https://github.com/grusell/vivictpp/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "900cdfdbfdc00049adcc89075a8e90854a7a6635c3586904fc59b872370fd984"
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
    system "meson", "compile", "-C", "builddir"
    bin.install "builddir/vivictpp" => "vivictpp"
  end

  test do
    system "builddir/vivictpp", "--help"
  end
end
