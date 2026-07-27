class Macwash < Formula
  desc "Clean, optimize and speed up your Mac. Free and open source macOS cleaner CLI"
  homepage "https://github.com/toolka/MacWash"
  url "https://github.com/toolka/MacWash/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "7189cbb4dab44e19db9a0fd66e5e725b61d77cb2dbe5f83f545d6ae8bce313c1"
  license "MIT"
  version "1.0.7"

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
