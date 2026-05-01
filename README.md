# Raster & State Homebrew Tap

Homebrew formulae and casks for tools published by Raster & State.

## Install

```sh
brew tap rasterandstate/tap
```

## Available

| Name | Type | Install | Description |
| ---- | ---- | ------- | ----------- |
| [halfcaf](https://github.com/rasterandstate/halfcaf) | formula | `brew install halfcaf` | Headless work mode for macOS, CLI |
| [halfcaf](https://github.com/rasterandstate/halfcaf) | cask | `brew install --cask halfcaf` | Headless work mode for macOS, menu bar app |

The cask installs `HalfcafBar.app` into `/Applications` and symlinks
the bundled CLI onto your `PATH`, so `brew install --cask halfcaf`
gives you both the GUI and `halfcaf` on the command line.

## Updating a formula or cask

After cutting a new release of the underlying project (see
[halfcaf's `docs/releasing.md`](https://github.com/rasterandstate/halfcaf/blob/main/docs/releasing.md)
for the runbook):

1. Bump `version "X.Y.Z"` in both `Formula/halfcaf.rb` and
   `Casks/halfcaf.rb`.
2. Replace the `sha256` placeholders with the values printed by
   `scripts/release.sh` (or read from the corresponding `.sha256`
   sidecar files).
3. Open a PR. CI will run `brew audit --strict` and verify the
   formula installs cleanly.

## License

MIT, matching the upstream projects.
