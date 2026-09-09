# zsh

Powerful but tastefully minimal zsh configuration.

## Dependencies

### Ubuntu

```sh
sudo apt install zsh eza bat fd-find ripgrep just tmux tmuxp stow curl git direnv clangd luarocks

# install neovim from appimage 0.11.7
mkdir -p ~/.local/{neovim.app,bin} && cd ~/.local/neovim.app
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.7/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
ln -s ~/.local/neovim.app/nvim-linux-x86_64.appimage ~/.local/bin/nvim

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

# install kitty

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' > ~/.config/xdg-terminals.list



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
