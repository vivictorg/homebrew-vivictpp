class Vivictpp < Formula
  desc "Vivict++ is an easy to use tool for subjective comparison of the visual quality of different encodings of the same video source."
  homepage "https://github.com/svt/vivictpp"
  url "https://github.com/svt/vivictpp/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "125870dd3c10b27968bd609a17ad4476d4fe6b1ad6d3e0de0fda31b4d9c0b71f"
  head "https://github.com/svt/vivictpp.git", :branch => "dev"
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
