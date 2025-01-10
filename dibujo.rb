class Dibujo < Formula
  desc "SFML Drawing Tool with Features"
  homepage "https://github.com/soycarlo99/dibujo"
  url "https://github.com/soycarlo99/dibujo/archive/v1.0.tar.gz"
  sha256 "e856b7ddcd5590c0411ba1d33e89f34ac1236354ca7a8624a7c5ca9982048321"
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
