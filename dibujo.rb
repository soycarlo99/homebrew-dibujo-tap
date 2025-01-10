class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
  url "https://github.com/soycarlo99/dibujo/archive/v1.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  depends_on "sfml"

  def install
    system "make"
    bin.install "dibujov0.1"
  end

  test do
    system "#{bin}/dibujov0.1", "--version"
  end
end
