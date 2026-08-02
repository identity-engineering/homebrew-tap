# Identity Engineering OS CLI
# Tap: identity-engineering/tap
# Install: brew tap identity-engineering/tap && brew install ie-os
#
# Canonical artifacts: https://identity-engineering.org/releases/ie-os/{version}/

class IeOs < Formula
  desc "Identity Engineering OS — local-first identity runtime CLI (ie)"
  homepage "https://identity-engineering.org"
  url "https://identity-engineering.org/releases/ie-os/2026.8.2/ie_os-2026.8.2.tar.gz"
  version "2026.8.2"
  sha256 "b274d5462d069dc3bc64c53d6419e6e15ee0ece7d2af46842439685902f414dc"
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
