class Vivictpp < Formula
  desc "Vivict++ is an easy to use tool for subjective comparison of the visual quality of different encodings of the same video source."
  homepage "https://github.com/vivictorg/vivictpp"
  url "https://github.com/vivictorg/vivictpp/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "6035d34c60338191f0ec98cd2b2fe16ebac9e43a4dcabbf903766ea22849c7ae"
  head "https://github.com/vivictorg/vivictpp.git", :branch => "dev"
  license "GPL-2.0-or-later"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cmake" => :build
  depends_on "pkgconf" => :build

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
