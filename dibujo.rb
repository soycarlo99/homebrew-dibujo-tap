class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
  url "https://github.com/soycarlo99/dibujo/archive/refs/tags/v0.11.tar.gz"
sha256 "d35f4bc1fd3e368218e67bba36228ba25938dc6c8b7263b23e484a8ad11080f1"
  license "MIT"

  depends_on "sfml@2"

  def install
    ENV["CXXFLAGS"] = "-std=c++17 -I#{Formula["sfml@2"].opt_include}"
    ENV["LDFLAGS"]  = "-L#{Formula["sfml@2"].opt_lib} -lsfml-graphics -lsfml-window -lsfml-system"

    # Build your app
    system "make"

    # Install the binary under a new name:
                bin.install "dibujo_0.11" => "dibujo"

    # Install assets
    (share/"dibujo").install "arial.ttf", "circle.png", "squares.png", "draw.png", "text.png", "triangle.png", "bucket.png", "rainbow.png", "logo.png"
  end

  test do
    system "#{bin}/dibujo", "--version"
  end

  def caveats
    <<~EOS
      Thank you for installing Dibujo v0.01!

      To run the program, simply type:
        dibujo

      For help and usage instructions, visit:
        https://github.com/soycarlo99/dibujo

      Enjoy drawing!
    EOS
  end
end
