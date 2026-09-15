# ~/.config/zsh/prompt.zsh

# Prevent Python virtualenv from polluting the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

FUNCNEST=100

eval "$(starship init zsh)"

# Starship Transient Prompt Workaround for Zsh
starship_zle-line-init() {
    if [[ "$CONTEXT" == start ]]; then
        # Re-render the full Starship prompt for active input
        PROMPT=$(starship prompt)
        zle reset-prompt
    fi
}

starship_zle-line-finish() {
    # Replace the prompt with just the character when executing
    PROMPT='%F{blue}❯%f '

    zle reset-prompt
}

# Register the hooks into Zsh line editor
zle -N zle-line-init starship_zle-line-init
zle -N zle-line-finish starship_zle-line-finish
