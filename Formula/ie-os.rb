# Identity Engineering OS CLI
# Tap: identity-engineering/tap
# Install: brew tap identity-engineering/tap && brew install ie-os
#
# Canonical artifacts: https://identity-engineering.org/releases/ie-os/{version}/

class IeOs < Formula
  desc "Identity Engineering OS — local-first identity runtime CLI (ie)"
  homepage "https://identity-engineering.org"
  url "https://identity-engineering.org/releases/ie-os/2026.8.12/ie_os-2026.8.12.tar.gz"
  version "2026.8.12"
  sha256 "44503a70173260da584d4f5883c27831a8346d16a45fcb666f3f13685878e256"
  license "MIT"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    venv = libexec/"venv"
    system python, "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"
    system venv/"bin/pip", "install", buildpath.to_s
    bin.install_symlink venv/"bin/ie"
  end

  test do
    assert_match(/ie-os|0\./, shell_output("#{bin}/ie --version"))
  end
end
