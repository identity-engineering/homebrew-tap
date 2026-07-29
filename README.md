# identity-engineering/tap

Homebrew tap for **Identity Engineering OS** (`ie` CLI).

## Install

```bash
brew tap identity-engineering/tap
brew install ie-os
```

Then create a personal install (data lives outside the formula):

```bash
mkdir -p ~/ie && cd ~/ie
ie init . --handle your-handle --name "Your Name"
ie status
```

Upgrade later:

```bash
brew update
brew upgrade ie-os
```

## What this does / does not do

| Does | Does not |
|------|----------|
| Install the `ie` CLI tool system-wide via Homebrew | Store your Stem / Registry / private Mass data |
| Pull source once during `brew install` (you do not manually `git clone` + `pip install -e`) | Replace a full identity platform |

Your Identity files are created only by `ie init` in a directory you choose (e.g. `~/ie`).

## Private repository note

If `identity-engineering/os` is **private**, Homebrew must authenticate to download the source tarball:

```bash
# GitHub personal access token with repo read scope
export HOMEBREW_GITHUB_API_TOKEN=ghp_…
brew install ie-os
```

Or use SSH-capable setup / make a public release tarball / publish to PyPI and point the formula at PyPI instead.

For a smooth public install path long-term, preferred order:

1. Merge CLI → tag `v0.1.0` on `os`
2. Formula `url` + real `sha256` on the tag archive
3. Optional: publish `ie-os` to PyPI; formula installs from PyPI
4. Much later: consider `homebrew-core` (stable releases, audit, not a v0 step)

## Formula

- [`Formula/ie-os.rb`](Formula/ie-os.rb) — Python 3.12 venv, `pip install` of the OS package, symlink `ie`

## Related

- Runtime + CLI source: [identity-engineering/os](https://github.com/identity-engineering/os)
- Docs in os: `docs/cli.md`
