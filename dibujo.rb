class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
  url "https://github.com/soycarlo99/dibujo/archive/v1.3.tar.gz"
  sha256 "2bba2cbec328e808195ecfadd98bab14d5a2c3342ce10d134c0a91dbbb4bbd62" 
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
end
