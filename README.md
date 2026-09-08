# zsh

Powerful but tastefully minimal zsh configuration.

## Dependencies

### Ubuntu

```sh
sudo apt install zsh neovim eza bat fd-find ripgrep just tmux tmuxp stow curl git direnv clangd
# install zoxide, starship and oh-my-zsh separately
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
curl -sS https://starship.rs/install.sh | sh
ZSH=$HOME/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-zsh
# install getnf to download nerdfonts (I like the font Meslo)
# See also: https://gnulinux.ch/nerd-fonts-unter-debian-installieren
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf
```

## Setup

**1. Clone the repo**

```sh
git clone https://github.com/sebastianstigler/dotfiles ~/dotfiles

cd ~/dotfiles
. ./setup.sh
```

**2. Point zsh at the config directory**

Add the following to `/etc/zsh/zshenv`:

```sh
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

**3. Set zsh as your default shell**

Only necessary if you didn't let oh-my-zsh do it for you:

```sh
chsh -s $(which zsh)
```

**4. Create required directories**

```sh
# history
mkdir -p ~/.local/state/zsh
# completion cache
mkdir -p ~/.cache/zsh
```

**5. Start a new shell**

Plugins are installed automatically on first launch via the built-in plugin manager.

Check individual README.md files for post-installation procedures.

## Plugins

Managed without a third-party plugin manager. Plugins are cloned into `$ZDOTDIR/plugins/` on first launch.

| Plugin                                                                                    | Purpose                         |
| ----------------------------------------------------------------------------------------- | ------------------------------- |
| [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) | Syntax highlighting             |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)                   | Fish-style inline suggestions   |
| [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) | Up/down arrow history filtering |
| [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode)                                  | Vi keybindings                  |

To update all plugins:

```sh
zplugin-update
```

## Keybindings

| Key       | Action                                              |
| --------- | --------------------------------------------------- |
| `Ctrl+R`  | Fuzzy history search (fzf)                          |
| `Ctrl+T`  | Fuzzy file search including hidden files (fzf + fd) |
| `Ctrl+F`  | Fuzzy file search excluding hidden files (fzf + fd) |
| `Ctrl+→`  | Move forward one word                               |
| `Ctrl+←`  | Move backward one word                              |
| `↑` / `↓` | History search by prefix                            |
| `Ctrl+\`  | Toggle autosuggestions                              |

## Starship Config

Included in the repo at [`starship.toml`](./starship.toml) and loaded automatically via `STARSHIP_CONFIG` in `.zshenv`. Requires a [Nerd Font](https://www.nerdfonts.com) in your terminal.
