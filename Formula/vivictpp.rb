class Vivictpp < Formula
  desc "Vivict++ is an easy to use tool for subjective comparison of the visual quality of different encodings of the same video source."
  homepage "https://github.com/vivictorg/vivictpp"
  url "https://github.com/vivictorg/vivictpp/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "122a717819cc18cbfbc06499ed3ebbc6f3b9325df0aeeb9e7eda5a65605f06b1"
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
