class Macwash < Formula
  desc "Clean, optimize and speed up your Mac. Free and open source macOS cleaner CLI"
  homepage "https://github.com/toolka/MacWash"
  url "https://github.com/toolka/MacWash/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8e099eb776c53f6005a669f52ceee0d512a8628a283003dcda6b5263a288a1f1"
  license "MIT"
  version "1.0.0"

  # Pure shell — no compilation needed, no Xcode CLT required
  bottle :unneeded

  def install
    # Install main binary
    bin.install "macwash"

    # Install lib and bin directories
    (prefix/"lib").install Dir["lib/*"]
    (prefix/"bin").install Dir["bin/*"]

    # Make all bin scripts executable
    chmod 0755, Dir["#{prefix}/bin/*"]
  end

  def post_install
    # Point the installed macwash binary to its lib/bin location
    inreplace bin/"macwash", /^SCRIPT_DIR=.*/, "SCRIPT_DIR=\"#{prefix}\""
  end

  test do
    output = shell_output("#{bin}/macwash --version")
    assert_match "MacWash", output
  end
end
