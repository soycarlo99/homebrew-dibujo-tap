class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
  url "https://github.com/soycarlo99/dibujo/archive/v1.2.tar.gz"
  sha256 "b3ff1b77f33da60c5725fe4ee72a6d1c4cf0ba189e48fbe8eb1910c77caa040c"
  license "MIT"


  depends_on "sfml"

  def install
    ENV["CXXFLAGS"] = "-std=c++17 -I#{Formula["sfml"].opt_include}"
    ENV["LDFLAGS"] = "-L#{Formula["sfml"].opt_lib} -lsfml-graphics -lsfml-window -lsfml-system"
    system "make"
    bin.install "dibujov0.1"
  end

  test do
    system "#{bin}/dibujov0.1", "--version"
  end
end
