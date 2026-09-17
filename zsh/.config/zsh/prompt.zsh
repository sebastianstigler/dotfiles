# ~/.config/zsh/prompt.zsh

# Prevent Python virtualenv from polluting the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

FUNCNEST=100

eval "$(starship init zsh)"

# Save the normal Starship prompt
starship_zsh_prompt="$PROMPT"

# # Starship Transient Prompt Workaround for Zsh
starship_zle-line-init() {
    # Restore Starship's full prompt when starting a new command
    PROMPT="$starship_zsh_prompt"
    zle reset-prompt
}

starship_zle-line-finish() {
    # Replace the prompt with just the character when executing
    PROMPT='%F{blue}❯%f '

    zle reset-prompt
}

# Register the hooks into Zsh line editor
zle -N zle-line-init starship_zle-line-init
zle -N zle-line-finish starship_zle-line-finish
