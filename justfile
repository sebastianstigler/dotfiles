apt_pkgs := "curl direnv eza fd-find git ripgrep stow wget zsh"
bat_version := "0.26.1"
bat_deb := 'bat_' + bat_version + '_amd64.deb'
bat_download := 'https://github.com/sharkdp/bat/releases/download/v' + bat_version + '/' + bat_deb
zshenv := "/etc/zsh/zshenv"

stow_basics := "zsh git vim"
stow_essentials := "nvim tmux"
stow_terminal := "alacritty ptyxis"

stow_doc := f"""
tow dotfiles from [pkgs].
   [pkgs] can be "basics" for {{ stow_basics }},
                 "essentials" for {{ stow_essentials }},
                 "teminals" for {{ stow_terminal }}
                 or just one of the entries above.
"""
S_STOW_DOC := 'S' + stow_doc
r_stow_doc := 'Res' + stow_doc
u_stow_doc := 'Uns' + stow_doc

_default:
    @just --list --unsorted

help:
    @echo """

    """

# Install general dependencies
bootstap: && _install_apt_pkgs _set_xdg_config_home _set_zsh _install_bat_download _install_zoxide _install_fzf _install_getnf _install_starship _install_oh_my_zsh
    @echo -n "🎁  \e[34;1mBootstap dependencies for \e[0;36m{{ file_stem(justfile_directory()) }}\e[0m\n    "

# Stow given list of packages   (see: `just help` for details)
stow +pkgs="basics": (_stow_action "S" "true" pkgs)

# Restow given list of packages (see: `just help` for details)
restow +pkgs="basics": (_stow_action "R" "false" pkgs)

# Unstow given list of packages (see: `just help` for details)
unstow +pkgs="basics": (_stow_action "D" "false" pkgs)

_stow_action action show_justfile +pkgs:
    #!/bin/bash
    read -ra _STOW_BASICS <<< $(echo " {{ stow_basics }}" | sed 's/ / basics_/g')
    read -ra _STOW_ESSENTIALS <<< $(echo " {{ stow_essentials }}" | sed 's/ / essentials_/g')
    read -ra _STOW_TERMINAL <<< $(echo " {{ stow_terminal }}" | sed 's/ / terminal_/g')

    # Expand list of packages
    pkg_dirs=()
    for pkg in $(echo {{ pkgs }} | sed 's/ /\n/g')
    do
        case "$pkg" in 
            basics)
                pkg_dirs+=(${_STOW_BASICS[@]})
                ;;
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
            *) echo -e " ⚡ \e[31;3m$pkg\e[31;1m is an unknown package for stow\e[0m">&2 
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
            S) echo -e "🎁  \e[34;1mstow $pkg\e[0m"
                stow $pkg
                ;;
            R) echo -e "🎁  \e[34;1mstow -R $pkg\e[0m"
                stow -R $pkg
                ;;
            D) echo -e "🎁  \e[34;1mstow -D $pkg\e[0m"
                stow -D $pkg
                ;;
            *) echo -e " ⚡ \e[31;3m{{ action }}\e[31;1m is a unknown stow action\e[0m">&2 
               exit 1;;
        esac
        if [[ "{{ show_justfile }}" == "true" ]] && [[ -f "${pkg}/justfile" ]]; then
            echo -e "    \e[33;1mPost stow actions: \e[0;36;3mjust ${pkg}/\e[0m"; \
        fi 
    done

_install_apt_pkgs:
    @sudo apt install {{ apt_pkgs }} -y

_set_xdg_config_home:
    @/usr/bin/grep -q ZDOTDIR {{ zshenv }} 2>/dev/null || ( \
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
    ) | sudo tee -a {{ zshenv }} > /dev/null 

_set_zsh:
    @chsh -s /usr/bin/zsh

_install_bat_download:
    @(\
    cd /tmp; \
    curl -LO {{ bat_download }}; \
    sudo apt install /tmp/{{ bat_deb }} -y; \
    rm /tmp/{{ bat_deb }} -f; \
    )

_install_zoxide:
    @curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

_install_starship:
    @curl -sS https://starship.rs/install.sh | sh

_install_fzf:
    @git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    @~/.fzf/install --no-zsh

_install_getnf:
    @curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
    @~/.local/bin/getnf -i 'Meslo'

_install_oh_my_zsh:
    @ZSH=$HOME/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --unattended --keep-zshrc)"
