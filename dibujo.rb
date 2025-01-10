class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
url "https://github.com/soycarlo99/dibujo/releases/tag/v1.2"
  sha256 "2e2c427cd9fba4ea12c7f3c1e08763a4aead23f06da283e2e2f58ee42cab7a00"
  license "MIT"


  depends_on "sfml"

  def install
    ENV["CXXFLAGS"] = "-std=c++11 -I#{Formula["sfml"].opt_include}"
    ENV["LDFLAGS"] = "-L#{Formula["sfml"].opt_lib} -lsfml-graphics -lsfml-window -lsfml-system"
    system "make"
    bin.install "dibujov0.1"
  end

  test do
    system "#{bin}/dibujov0.1", "--version"
  end
end
