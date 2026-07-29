# Identity Engineering OS CLI
# Tap: identity-engineering/tap
# Install: brew tap identity-engineering/tap && brew install ie-os
#
# Early formula: installs from GitHub source into an isolated venv.
# Prefer versioned tags + sha256 once releases are cut.

class IeOs < Formula
  desc "Identity Engineering OS — local-first identity runtime CLI (ie)"
  homepage "https://identity-engineering.org"
  # Until the first tagged release, install from the CLI branch (or switch to main after merge).
  url "https://github.com/identity-engineering/os/archive/refs/heads/feature/cli-skeleton.tar.gz"
  version "0.1.0-cli"
  sha256 :no_check
  license "MIT"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    venv = libexec/"venv"
    system python, "-m", "venv", venv

    # Upgrade pip inside venv, then install this source tree (pyproject.toml).
    system venv/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"
    system venv/"bin/pip", "install", buildpath.to_s

    # Expose the console script on PATH
    bin.install_symlink venv/"bin/ie"
  end

  test do
    assert_match(/ie-os|0\./, shell_output("#{bin}/ie --version"))
  end
end
