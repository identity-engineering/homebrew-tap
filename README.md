# identity-engineering/tap

Homebrew tap for **Identity Engineering OS** (`ie` CLI).

## Install (target UX)

```bash
brew tap identity-engineering/tap
brew install ie-os
ie init          # interactive; default path ~/ie — no prior mkdir
```

**Free users must not need a GitHub account or token.**  
That requires the Formula to install from a **public** package (PyPI or public release archive), not from a private git tarball.

See upstream `docs/distribution.md` in [identity-engineering/os](https://github.com/identity-engineering/os).

## Current status (v0)

The Formula still points at the `os` GitHub source tree for development.

| If `os` is… | What happens |
|-------------|--------------|
| **Private** | `brew install` needs `HOMEBREW_GITHUB_API_TOKEN` — **not** acceptable for Free public UX |
| **Public release / PyPI** | Token-free install — the intended end state |

Next packaging steps:

1. Publish `ie-os` to PyPI (or public GitHub Release assets)
2. Point `Formula/ie-os.rb` at PyPI / public archive + real `sha256`
3. Keep private git for day-to-day development if desired

## After install

```bash
ie init
# path [~/ie], handle, name, tier free|pro (pro stub in v0)
ie status
```

Identity data stays in the directory you choose — not inside Homebrew’s Cellar as “your Mass”.

## Related

- Source / CLI: [identity-engineering/os](https://github.com/identity-engineering/os)
- Distribution rules: `docs/distribution.md`
