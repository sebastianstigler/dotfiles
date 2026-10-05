export GIT_CONFIG_GLOBAL=$HOME/.config/git/config_work

# flutter
if [[ -d  "/flut/flutter/3.27.4/bin" ]]; then
  export PATH="/flut/flutter/3.27.4/bin:$PATH"
fi

# cargo / rust
if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

# pnpm
if [[ -d "$HOME/.local/share/pnpm" ]]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi

if [[ -f "$HOME/.local/bin/try.rb" ]]; then
  # try "https://github.com/tobi/try
  # curl -sL https://raw.githubusercontent.com/tobi/try/refs/tags/v1.0.0/try.rb > ~/.local/bin/try.rb
  eval "$(~/.local/bin/try.rb init ~/src/tries)"
fi
