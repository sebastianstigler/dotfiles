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
export FZF_DEFAULT_OPTS='--height 60% --popup 100%,60% --style full'
# ---------- fzf ----------
# Default options

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'

# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"          "$@" ;;
    ssh)          fzf --preview 'dig {}'                    "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}'  "$@" ;;
  esac
}

# ---------- PATH ----------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"

