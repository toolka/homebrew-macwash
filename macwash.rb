class Macwash < Formula
  desc "Clean, optimize and speed up your Mac. Free and open source macOS cleaner CLI"
  homepage "https://github.com/toolka/MacWash"
  url "https://github.com/toolka/MacWash/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "5c1b3c3e2578fe7a53c6b2af8cd15221dceb2d5c21805cae483dba6bfd375615"
  license "MIT"
  version "1.0.5"

  def install
    bin.install "macwash"
    (prefix/"lib").install Dir["lib/*"]
    (prefix/"bin").install Dir["bin/*"]
    chmod 0755, Dir["#{prefix}/bin/*"]
    inreplace bin/"macwash", /^SCRIPT_DIR=.*/, "SCRIPT_DIR=\"#{prefix}\""
  end

  test do
    output = shell_output("#{bin}/macwash --version")
    assert_match "MacWash", output
  end
end
