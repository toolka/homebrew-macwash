class Macwash < Formula
  desc "Clean, optimize and speed up your Mac. Free and open source macOS cleaner CLI"
  homepage "https://github.com/toolka/MacWash"
  url "https://github.com/toolka/MacWash/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "2645fbd4597eb8bcbf040123a0945317e959199de7fea15241e3746f9596f63f"
  license "MIT"
  version "1.0.4"

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
