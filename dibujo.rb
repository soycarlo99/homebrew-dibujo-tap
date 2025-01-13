class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
url "https://github.com/soycarlo99/dibujo/tar.gz/refs/tags/v0.10"
sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "sfml@2"

  def install
    ENV["CXXFLAGS"] = "-std=c++17 -I#{Formula["sfml@2"].opt_include}"
    ENV["LDFLAGS"]  = "-L#{Formula["sfml@2"].opt_lib} -lsfml-graphics -lsfml-window -lsfml-system"

    # Build your app
    system "make"

    # Install the binary under a new name:
      bin.install "dibujo-0.10/dibujo" => "dibujo"

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
