class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
  url "https://github.com/soycarlo99/dibujo/archive/v1.6.tar.gz"
  sha256 "33e6681f928da0c532ba03f0723b6a2fc6b649b5dcdcb160dbf7f4f7d94154ed"
  license "MIT"

  depends_on "sfml@2"

  def install
    ENV["CXXFLAGS"] = "-std=c++17 -I#{Formula["sfml@2"].opt_include}"
    ENV["LDFLAGS"] = "-L#{Formula["sfml@2"].opt_lib} -lsfml-graphics -lsfml-window -lsfml-system"
    system "make"
    bin.install "dibujov0.1"

    (share/"dibujo").install "arial.ttf", "circle.png", "squares.png", "draw.png", "text.png"
  end

  test do
    system "#{bin}/dibujov0.1", "--version"
  end

  def caveats
    <<~EOS
      Thank you for installing Dibujo v1.4!

      To run the program, execute:
        dibujov0.1

      For help and usage instructions, visit:
        https://github.com/soycarlo99/dibujo

      Enjoy drawing!
    EOS
  end
end
