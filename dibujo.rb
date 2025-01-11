class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
  url "https://github.com/soycarlo99/dibujo/archive/v1.6.tar.gz"
  sha256 "c10170fe420beb42a9b3164cad3a12c5d46a3914db0e2a12c0e3ed1093bff73b"
  license "MIT"

  depends_on "sfml@2"

  def install
    ENV["CXXFLAGS"] = "-std=c++17 -I#{Formula["sfml@2"].opt_include}"
    ENV["LDFLAGS"]  = "-L#{Formula["sfml@2"].opt_lib} -lsfml-graphics -lsfml-window -lsfml-system"

    # Build your app
    system "make"

    # Install the binary under a new name:
    bin.install "dibujov0.1" => "dibujo"

    # Install assets
    (share/"dibujo").install "arial.ttf", "circle.png", "squares.png", "draw.png", "text.png"
  end

  test do
    system "#{bin}/dibujo", "--version"
  end

  def caveats
    <<~EOS
      Thank you for installing Dibujo v1.6!

      To run the program, simply type:
        dibujo

      For help and usage instructions, visit:
        https://github.com/soycarlo99/dibujo

      Enjoy drawing!
    EOS
  end
end
