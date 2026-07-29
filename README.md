# identity-engineering/tap

Homebrew tap for **Identity Engineering OS** (`ie` CLI).

## Install (token-free Free path)

Public artifacts: [ie-os-dist](https://github.com/identity-engineering/ie-os-dist)

```bash
brew tap identity-engineering/tap
brew install ie-os
ie init
```

Requires a published `v0.1.0` (or later) asset on **ie-os-dist**.  
See upstream `docs/release.md` in the private `os` repo for how to cut a release.

## After install

```bash
ie init
# path [~/ie], account, preferred name, local_handle
ie status
```

## Formula

[`Formula/ie-os.rb`](Formula/ie-os.rb) — Python 3.12 venv, pip-install from public sdist.

After each release: set real `sha256` (drop `:no_check`).
