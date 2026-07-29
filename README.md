# identity-engineering/tap

Homebrew tap for **Identity Engineering OS** (`ie` CLI).

## Install

Public artifacts are served only from the org domain:

```text
https://identity-engineering.org/releases/ie-os/{version}/ie_os-{version}.tar.gz
```

```bash
brew tap identity-engineering/tap
brew install ie-os
ie init
```

Requires the version file to exist on **identity-engineering.org** (Cloudflare R2 — see os repo issue). No GitHub token for end users.

## Formula

[`Formula/ie-os.rb`](Formula/ie-os.rb)
