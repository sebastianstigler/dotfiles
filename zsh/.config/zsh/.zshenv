# ~/.config/zsh/.zshenv

# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="vim"
export VISUAL="vim"

# ---------- Pager ----------
# from bat v0.25 on add --strip-ansi=always to MANPAGER
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
  export PAGER="bat --paging=always"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
  export PAGER="batcat --paging=always"
fi

# ---------- GPG ----------
export GPG_TTY=$(tty)

# ---------- Oh-My-Zsh ----------
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZDOTDIR/ohmyzsh_custom"

# ---------- Starship ----------
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"

# ---------- PATH ----------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"

