# Homebrew Ampcmd Tap

Homebrew tap for [ampcmd](https://github.com/soundslikeinfo/ampcmd) - chain multiple shell history commands using fuzzy selection.

## Installation

```bash
# Add the tap
brew tap soundslikeinfo/ampcmd

# Install ampcmd
brew install ampcmd
```

## What is ampcmd?

Visit the [main repository](https://github.com/soundslikeinfo/ampcmd) for:
- Source code
- Issue tracking
- Documentation
- Contribution guidelines

## Requirements

- `fzf` (automatically installed as a dependency)
- zsh 5.8+, fish 3.0+, or bash 4.0+

## Shell Configuration

After installation, add the following to your shell configuration:

### zsh (~/.zshrc)
```bash
source $(brew --prefix ampcmd)/zsh/ampcmd.plugin.zsh
```

### bash (~/.bashrc)
```bash
source $(brew --prefix ampcmd)/bash/ampcmd.bash
```

### fish (~/.config/fish/config.fish)
```bash
bind \ch 'ampcmd'
```

Then reload your shell: `exec $SHELL`

## Uninstallation

```bash
brew uninstall ampcmd
brew untap soundslikeinfo/ampcmd
```

Remove the shell configuration lines you added to:
- `~/.zshrc` (zsh)
- `~/.bashrc` (bash)
- `~/.config/fish/config.fish` (fish)

## License

MIT License - see [soundslikeinfo/ampcmd](https://github.com/soundslikeinfo/ampcmd) for details.