class Macwash < Formula
  desc "Clean, optimize and speed up your Mac. Free and open source macOS cleaner CLI"
  homepage "https://github.com/toolka/MacWash"
  url "https://github.com/toolka/MacWash/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "32ef5e28e8895bef59959bd2a39ab7df2d53be05e2551e2f4ca082297e3f32a6"
  license "MIT"
  version "1.0.1"

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
