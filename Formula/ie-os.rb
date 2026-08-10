# Identity Engineering OS CLI
# Tap: identity-engineering/tap
# Install: brew tap identity-engineering/tap && brew install ie-os
#
# Canonical artifacts: https://identity-engineering.org/releases/ie-os/{version}/

class IeOs < Formula
  desc "Identity Engineering OS — local-first identity runtime CLI (ie)"
  homepage "https://identity-engineering.org"
  url "https://identity-engineering.org/releases/ie-os/2026.8.10/ie_os-2026.8.10.tar.gz"
  version "2026.8.10"
  sha256 "510eccf36622cb74e3b1e02a893a52628071c5c398905b3bf32a94e385b8c674"
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
