# identity-engineering/tap

Homebrew tap for **Identity Engineering OS** (`ie` CLI).

## Install

Artifacts are served from **identity-engineering.org** (not private GitHub):

```text
https://identity-engineering.org/releases/ie-os/0.1.0/ie_os-0.1.0.tar.gz
```

```bash
brew tap identity-engineering/tap
brew install ie-os
ie init
```

Requires that version’s file to exist on the org domain. See upstream `docs/release.md`.

## Formula

[`Formula/ie-os.rb`](Formula/ie-os.rb)
