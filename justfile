apt_pkgs := "curl direnv eza fd-find git ripgrep stow wget zsh"
# run apt update if the cache is older the ... minutes
apt_cache_refresh_age := "60"

bat_version := "0.26.1"
bat_deb := 'bat_' + bat_version + '_amd64.deb'
bat_download := 'https://github.com/sharkdp/bat/releases/download/v' + bat_version + '/' + bat_deb
getnf_font := "Meslo"
font := "MesloLGS Nerd Font"
zshenv := "/etc/zsh/zshenv"

stow_basics := "zsh git vim"
stow_essentials := "nvim tmux"
stow_terminal := "alacritty ptyxis"

_default:
    @just --list --unsorted

_done:
    @echo
    @echo "    ✨✨  \e[32;1mFinished\e[0m  ✨✨"
    @echo

# Install general dependencies
bootstrap: && _install_apt_pkgs _set_xdg_config_home _set_zsh _install_bat_download _install_zoxide _install_fzf _install_getnf _install_starship _install_oh_my_zsh _done
    @echo "🎁  \e[34;1mInstall general dependencies for \e[0;36m{{ file_stem(justfile_directory()) }}\e[0m"

_install_apt_pkgs:
    @echo -n "    \e[33;1m• \e[34mInstall \e[0;36mapt\e[34;1m packages\e[0m"
    @dpkg-query -s {{ apt_pkgs }} >/dev/null 2>&1 \
    && echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    || (\
    echo ''; \
    if [ -z "$(find /var/cache/apt/pkgcache.bin -mmin -{{ apt_cache_refresh_age }} 2>/dev/null)" ]; then \
    echo "      • \e[35mUpdate apt cache\e[0m"; \
    sudo apt-get update >/dev/null; \
    fi; \
    echo "      • \e[35mInstall: \e[1;35m{{ apt_pkgs }}\e[0m"; \
    sudo apt-get install {{ apt_pkgs }} -y >/dev/null; \
    )

_set_xdg_config_home:
    @echo -n "    \e[33;1m• \e[34mSet \e[0;36mXDG_CONFIG_HOME\e[34;1m globally\e[0m"
    @/usr/bin/grep -q ZDOTDIR {{ zshenv }} 2>/dev/null \
    && echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    || ( \
    echo ''; \
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
    )

_set_zsh:
    @echo -n "    \e[33;1m• \e[34mSet \e[0;36mzsh\e[34;1m as default shell\e[0m"
    @[ $(getent passwd $USER | cut -d':' -f7) = "/usr/bin/zsh" ] \
    && echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    || (\
    echo ''; \
    chsh -s /usr/bin/zsh; \
    )

_install_bat_download:
    @echo -n "    \e[33;1m• \e[34mInstall \e[0;36mbat\e[34;1m v{{ bat_version }}\e[0m"
    @if command -v bat 2>&1 >/dev/null; then (\
    echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    )\
    else (\
    echo ''; \
    cd /tmp; \
    curl -LO {{ bat_download }}; \
    sudo apt-get install /tmp/{{ bat_deb }} -y; \
    rm /tmp/{{ bat_deb }} -f; \
    ) fi

_install_zoxide:
    @echo -n "    \e[33;1m• \e[34mInstall \e[0;36mzoxide\e[0m"
    @[ -f ~/.local/bin/zoxide ] \
    && echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    || (\
    echo ''; \
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh ; \
    )

_install_fzf:
    @echo -n "    \e[33;1m• \e[34mInstall \e[0;36mfzf\e[0m"
    @[ -f ~/.fzf/install ] \
    && echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    || (\
    echo ''; \
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; \
    ~/.fzf/install --no-zsh; \
    )

_install_getnf: && _install_font
    @echo -n "    \e[33;1m• \e[34mInstall \e[0;36mgetnf\e[0m"
    @[ -f ~/.local/bin/getnf ] \
    && echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    || (\
    echo ''; \
    curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash; \
    )

_install_font:
    @echo -n "    \e[33;1m• \e[34mInstall \e[0;36m{{ getnf_font }}\e[34;1m font\e[0m"
    @[ "$(fc-match "{{ font }}" -f '%{family}')" = "{{ font }}" ] \
    && echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    || (\
    echo ''; \
    ~/.local/bin/getnf -i "{{ getnf_font }}"; \
    )

_install_starship:
    @echo -n "    \e[33;1m• \e[34mInstall \e[0;36mstarship\e[0m"
    @if  command -v starship 2>&1 >/dev/null; then (\
    echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    )\
    else (\
    echo ''; \
    curl -sS https://starship.rs/install.sh | sh ; \
    ) fi

_install_oh_my_zsh:
    @echo -n "    \e[33;1m• \e[34mInstall \e[0;36moh-my-zsh\e[0m"
    @[ -f ~/.oh-my-zsh/oh-my-zsh.sh ] \
    && echo ' \e[34;1m[\e[31;1mskipped\e[34;1m]\e[0m' \
    || (\
    echo ''; \
    ZSH=$HOME/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --unattended --keep-zshrc)"; \
    )

# Stow packages   (see: `just help-stow` for details)
stow +pkgs="basics": && (_stow_action "S" "true" pkgs)
    @echo "🎁  \e[34;1mStow packages \e[0;36m{{ pkgs }}\e[0m"

# Restow packages (see: `just help-stow` for details)
restow +pkgs="basics": && (_stow_action "R" "false" pkgs)
    @echo "🎁  \e[34;1mRestow packages \e[0;36m{{ pkgs }}\e[0m"

# Unstow packages (see: `just help-stow` for details)
unstow +pkgs="basics": && (_stow_action "D" "false" pkgs)
    @echo "🎁  \e[34;1mUnstow packages \e[0;36m{{ pkgs }}\e[0m"

# Help for the stow|restow|unstow recipe
help-stow:
    @echo "🎁  \e[34;1mHelp for \e[0;34mstow\e[0m|\e[34mrestow\e[0m|\e[34munstow\e[1m \e[0m[\e[36mpackages\e[0m]."
    @echo "    \e[36mpackages\e[0m can be:"
    @echo "         \e[35;1mbasics\e[0m for \e[95m{{ stow_basics }}\e[0m,"
    @echo "         \e[35;1messentials\e[0m for \e[95m{{ stow_essentials }}\e[0m,"
    @echo "         \e[35;1mterminals\e[0m for \e[95m{{ stow_terminal }}\e[0m,"
    @echo "         \e[35;1mall\e[0m is short for \e[35;1mbasics essentials terminals\e[0m"
    @echo "         or just one or more of the \e[95mentries\e[0m above."

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
            *) echo -e "    ⚡ \e[31;3m$pkg\e[31;1m is an unknown package for stow\e[0m ⚡">&2 
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
            S) echo -e "    \e[33;1m• \e[34;1mstow $pkg\e[0m"
                stow $pkg
                ;;
            R) echo -e "    \e[33;1m• \e[34;1mstow -R $pkg\e[0m"
                stow -R $pkg
                ;;
            D) echo -e "    \e[33;1m• \e[34;1mstow -D $pkg\e[0m"
                stow -D $pkg
                ;;
            *) echo -e "  ⚡ \e[31;3m{{ action }}\e[31;1m is a unknown stow action\e[0m ⚡">&2 
               exit 1;;
        esac
        if [[ "{{ show_justfile }}" == "true" ]] && [[ -f "${pkg}/justfile" ]]; then
            echo -e "      \e[31;1m╰─❯ \e[0;33;1mPost stow actions: \e[0;36;3mjust ${pkg}/\e[0m"; \
        fi 
    done

