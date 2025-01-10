class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
  url "https://github.com/soycarlo99/dibujo/archive/v1.4.tar.gz"
  sha256 "da6997a179b8eed59daaaaa84df31db369cdf04975a8a34d20ab35d87d29c366"
  license "MIT"

  depends_on "sfml@2"

  def install
    ENV["CXXFLAGS"] = "-std=c++17 -I#{Formula["sfml@2"].opt_include}"
    ENV["LDFLAGS"] = "-L#{Formula["sfml@2"].opt_lib} -lsfml-graphics -lsfml-window -lsfml-system"
    system "make"
    bin.install "dibujov0.1"
    (share/"dibujo").install "arial.ttf"
  end

  test do
    system "#{bin}/dibujov0.1", "--version"
  end

  def caveats
    <<~EOS
      Thank you for installing Dibujo v1.2!

      To run the program, execute:
        dibujov0.1

      For help and usage instructions, visit:
        https://github.com/soycarlo99/dibujo

      Enjoy drawing!
    EOS
  end 
end
