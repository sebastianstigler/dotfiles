export GIT_CONFIG_GLOBAL=$HOME/.config/git/config_work
# flutter
export PATH="/flut/flutter/3.27.4/bin:$PATH"
# cargo / rust
. "$HOME/.cargo/env"
# pnpm
export PNPM_HOME="/home/sebastian/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# try "https://github.com/tobi/try
# curl -sL https://raw.githubusercontent.com/tobi/try/refs/tags/v1.0.0/try.rb > ~/.local/bin/try.rb
eval "$(~/.local/bin/try.rb init ~/src/tries)"
