# Max's Homebrew Tap

Install Ringbinder:

```sh
brew install maxim/tap/ringbinder
```

Upgrade an existing installation:

```sh
brew upgrade ringbinder
```

See the [Ringbinder documentation](https://github.com/maxim/ringbinder) for configuration and usage.

## Maintenance

`Formula/ringbinder.rb` compiles a pinned Ringbinder tag and commit from source. Go is a build-only dependency; the installed command has no runtime formula dependencies.

The Ringbinder release workflow updates the tag and revision with Homebrew's `brew bump-formula-pr`. Formula pull requests must pass this tap's exact macOS and Linux test-bot checks before the workflow squash-merges them. Keep Homebrew autobump and bottle publishing disabled.
