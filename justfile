set dotenv-filename := ".env"
set dotenv-load

apt_pkgs := "curl direnv eza fd-find git ripgrep stow vim wget zsh"
# run apt update if the cache is older the ... minutes
apt_cache_refresh_age := "60"

bat_version := "0.26.1"
bat_deb := "bat_" + bat_version + "_amd64.deb"
bat_download := "https://github.com/sharkdp/bat/releases/download/v" + bat_version + "/" + bat_deb
getnf_font := "Meslo"
font := "MesloLGS Nerd Font"
zshenv := "/etc/zsh/zshenv"

stow_basics := "zsh git vim"
stow_essentials := "nvim tmux"
stow_terminal := "alacritty ptyxis"

_default:
    @just --list --unsorted

_post_action:
    @echo "\n    ${UI_ACOL}Logoff and Login to load new environment variables!${UI_NORMAL}"

_done:
    @echo "${UI_FINISHED}"

# Install general dependencies
bootstrap: && _install_apt_pkgs _set_xdg_config_home _set_zsh _install_bat_download _install_zoxide _install_fzf _install_getnf _install_starship _install_oh_my_zsh _post_action _done
    @echo "${UI_RSYM}Install general dependencies for ${UI_RHIC}{{ file_stem(justfile_directory()) }}${UI_NORMAL}"

_install_apt_pkgs:
    @echo -n "${UI_SSYM}Install ${UI_SHIC}apt${UI_SCOL} packages${UI_NORMAL}"
    @if dpkg-query -s {{ apt_pkgs }} >/dev/null 2>&1; then echo $UI_SKIPPED; else echo ""; \
    if [ -z "$(find /var/cache/apt/pkgcache.bin -mmin -{{ apt_cache_refresh_age }} 2>/dev/null)" ]; then \
    echo "${UI_PSYM}Update apt cache${UI_NORMAL}"; \
    sudo apt-get update >/dev/null; \
    if apt-get -s upgrade | grep -q '^Inst'; then \
    echo "${UI_PSYM}Upgrade apt packages${UI_NORMAL}"; \
    sudo apt-get upgrade -y >/dev/null; \
    fi; \
    fi; \
    echo "${UI_PSYM}Install: ${UI_PHIC}{{ apt_pkgs }}${UI_NORMAL}"; \
    sudo apt-get install {{ apt_pkgs }} -y >/dev/null; \
    fi

_set_xdg_config_home:
    @echo -n "${UI_SSYM}Set ${UI_SHIC}XDG_CONFIG_HOME${UI_SCOL} globally${UI_NORMAL}"
    @if /usr/bin/grep -q ZDOTDIR {{ zshenv }} 2>/dev/null; then echo $UI_SKIPPED; else echo ""; \
    (\
    echo ''; \
    echo 'if [[ -z "$XDG_CONFIG_HOME" ]]'; \
    echo 'then'; \
    echo '    export XDG_CONFIG_HOME="$HOME/.config"'; \
    echo 'fi'; \
    echo ''; \
    echo 'if [[ -d "$XDG_CONFIG_HOME/zsh" ]]'; \
    echo 'then'; \
    echo '    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"'; \
    echo 'fi'; \
    ) | sudo tee -a {{ zshenv }} > /dev/null; \
    fi

_set_zsh:
    @echo -n "${UI_SSYM}Set ${UI_SHIC}zsh${UI_SCOL} as default shell${UI_NORMAL}"
    @if [ $(getent passwd $USER | cut -d':' -f7) = "/usr/bin/zsh" ]; then echo $UI_SKIPPED; else echo ""; \
    chsh -s /usr/bin/zsh; \
    fi

_install_bat_download:
    @echo -n "${UI_SSYM}Install ${UI_SHIC}bat${UI_SCOL} v{{ bat_version }}${UI_NORMAL}"
    @if command -v bat 2>&1 >/dev/null; then echo $UI_SKIPPED; else echo ""; \
    ( cd /tmp; \
    echo "${UI_PSYM}Download ${UI_PHIC}{{ bat_deb }}${UI_NORMAL}"; \
    curl -LO {{ bat_download }} >/dev/null 2>&1; \
    echo "${UI_PSYM}Install ${UI_PHIC}{{ bat_deb }}${UI_NORMAL}"; \
    sudo apt-get install /tmp/{{ bat_deb }} -y >/dev/null 2>&1; \
    rm /tmp/{{ bat_deb }} -f; \
    ) fi

_install_zoxide:
    @echo -n "${UI_SSYM}Install ${UI_SHIC}zoxide${UI_NORMAL}"
    @if [ -f ~/.local/bin/zoxide ]; then echo $UI_SKIPPED; else echo ""; \
    echo "${UI_PSYM}Download and install ${UI_PHIC}zoxide${UI_NORMAL}"; \
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh >/dev/null ; \
    fi

_install_fzf:
    @echo -n "${UI_SSYM}Install ${UI_SHIC}fzf${UI_NORMAL}"
    @if [ -f ~/.fzf/install ]; then echo $UI_SKIPPED; else echo ""; \
    echo "${UI_PSYM}Git clone ${UI_PHIC}fzf${UI_PCOL} repo${UI_NORMAL}"; \
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf >/dev/null 2>&1; \
    echo "${UI_PSYM}Install ${UI_PHIC}fzf${UI_NORMAL}"; \
    ~/.fzf/install --no-zsh --no-bash --no-update-rc --completion --key-bindings >/dev/null 2>&1; \
    fi

_install_getnf: && _install_font
    @echo -n "${UI_SSYM}Install ${UI_SHIC}getnf${UI_NORMAL}"
    @if [ -f ~/.local/bin/getnf ]; then echo $UI_SKIPPED; else echo ""; \
    curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash >/dev/null 2>&1; \
    fi

_install_font:
    @echo -n "${UI_SSYM}Install ${UI_SHIC}{{ getnf_font }}${UI_SCOL} font${UI_NORMAL}"
    @if [ "$(fc-match "{{ font }}" -f '%{family}')" = "{{ font }}" ]; then echo $UI_SKIPPED; else echo ""; \
    ~/.local/bin/getnf -i "{{ getnf_font }}" | paste /dev/null -; \
    fi

_install_starship:
    @echo -n "${UI_SSYM}Install ${UI_SHIC}starship${UI_NORMAL}"
    @if  command -v starship 2>&1 >/dev/null; then echo $UI_SKIPPED; else echo ""; \
    curl -sS https://starship.rs/install.sh | sh -s -- -y >/dev/null; \
    fi

_install_oh_my_zsh:
    @echo -n "${UI_SSYM}Install ${UI_SHIC}oh-my-zsh${UI_NORMAL}"
    @if [ -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then echo $UI_SKIPPED; else echo ""; \
    ZSH=$HOME/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended --keep-zshrc" >/dev/null 2>&1; \
    fi

# Stow packages   (see: `just help-stow` for details)
stow +pkgs="basics": && (_stow_action "S" "true" pkgs)
    @echo "${UI_RSYM}Stow packages ${UI_RHIC}{{ pkgs }}${UI_NORMAL}"

# Restow packages (see: `just help-stow` for details)
restow +pkgs="basics": && (_stow_action "R" "false" pkgs)
    @echo "${UI_RSYM}Restow packages ${UI_RHIC}{{ pkgs }}${UI_NORMAL}"

# Unstow packages (see: `just help-stow` for details)
unstow +pkgs="basics": && (_stow_action "D" "false" pkgs)
    @echo "${UI_RSYM}Unstow packages ${UI_RHIC}{{ pkgs }}${UI_NORMAL}"

# Help for the stow|restow|unstow recipe
help-stow:
    @echo "${UI_RSYM}Help for ${UI_SCOL}stow${UI_SEP}restow${UI_SEP}unstow${UI_NORMAL} [${UI_SHIC}packages${UI_NORMAL}]."
    @echo "    ${UI_SHIC}packages${UI_NORMAL} can be:"
    @echo "         ${UI_PHIC}basics${UI_NORMAL} for ${UI_PWAC}{{ stow_basics }}${UI_NORMAL},"
    @echo "         ${UI_PHIC}essentials${UI_NORMAL} for ${UI_PWAC}{{ stow_essentials }}${UI_NORMAL},"
    @echo "         ${UI_PHIC}terminals${UI_NORMAL} for ${UI_PWAC}{{ stow_terminal }}${UI_NORMAL},"
    @echo "         ${UI_PHIC}all${UI_NORMAL} is short for ${UI_PHIC}basics essentials terminals${UI_NORMAL}"
    @echo "         or just one or more of the ${UI_PWAC}entries${UI_NORMAL} above."

_stow_action action show_justfile +pkgs: && _done
    #!/bin/bash
    read -ra _STOW_BASICS <<< $(echo " {{ stow_basics }}" | sed 's/ / basics_/g')
    read -ra _STOW_ESSENTIALS <<< $(echo " {{ stow_essentials }}" | sed 's/ / essentials_/g')
    read -ra _STOW_TERMINAL <<< $(echo " {{ stow_terminal }}" | sed 's/ / terminal_/g')

    # Expand list of packages
    pkg_dirs=()
    for pkg in $(echo {{ pkgs }} | sed 's/ /\n/g')
    do
        case "$pkg" in 
            all)
                pkg_dirs+=(${_STOW_BASICS[@]})
                pkg_dirs+=(${_STOW_ESSENTIALS[@]})
                pkg_dirs+=(${_STOW_TERMINAL[@]}) ;;
            basics)
                pkg_dirs+=(${_STOW_BASICS[@]}) ;;
            essentials)
                pkg_dirs+=(${_STOW_ESSENTIALS[@]}) ;;
            terminals|terminal)
                pkg_dirs+=(${_STOW_TERMINAL[@]}) ;;
            zsh|git|vim)
                pkg_dirs+=(basics_$pkg) ;;
            tmux|nvim)
                pkg_dirs+=(essentials_$pkg) ;;
            alacritty|ptyxis)
                pkg_dirs+=(terminal_$pkg) ;;
            *) echo -e "${UI_SERS}$pkg${UI_SEMC} is an unknown package for stow${UI_SERE}">&2 
                exit 1
                ;;
        esac
    done

    # Deduplicate package list
    dedup_pkg_dirs=()
    declare -A seen 
    for pkg in "${pkg_dirs[@]}"
    do 
        if [[ ! ${seen[$pkg]+_} ]]; then
            seen[$pkg]=1
            dedup_pkg_dirs+=($pkg)
        fi 
    done

    # Run chosen action.
    for pkg in "${dedup_pkg_dirs[@]}"
    do 
        case {{ action }} in 
            S) echo -e "${UI_SSYM}stow $pkg${UI_NORMAL}"
                stow $pkg
                ;;
            R) echo -e "${UI_SSYM}stow -R $pkg${UI_NORMAL}"
                stow -R $pkg
                ;;
            D) echo -e "${UI_SSYM}stow -D $pkg${UI_NORMAL}"
                stow -D $pkg
                ;;
            *) echo -e "${UI_SERS}{{ action }}${UI_SEMC} is a unknown stow action${UI_SERE}">&2 
               exit 1;;
        esac
        if [[ "{{ show_justfile }}" == "true" ]] && [[ -f "${pkg}/justfile" ]]; then
            echo -e "${UI_ASYM}Post stow actions: ${UI_AHIC}just ${pkg}/${UI_NORMAL}"; \
        fi 
    done
