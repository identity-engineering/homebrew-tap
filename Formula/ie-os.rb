# Identity Engineering OS CLI
# Tap: identity-engineering/tap
# Install: brew tap identity-engineering/tap && brew install ie-os
#
# Downloads the public sdist from identity-engineering/ie-os-dist (not the private os git tree).

class IeOs < Formula
  desc "Identity Engineering OS — local-first identity runtime CLI (ie)"
  homepage "https://identity-engineering.org"
  url "https://github.com/identity-engineering/ie-os-dist/releases/download/v0.1.0/ie_os-0.1.0.tar.gz"
  version "0.1.0"
  # Replace after first public asset is uploaded (shasum -a 256 ie_os-0.1.0.tar.gz)
  sha256 :no_check
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
