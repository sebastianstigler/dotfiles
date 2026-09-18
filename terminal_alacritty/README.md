# install

```sh
sudo apt install alacritty
```

# Set to default (ubuntu < 25.04)

```sh
sudo update-alternative --config x-terminal-emulator
```

see also <https://ubuntu.com/desktop/docs/en/24.04/how-to/change-the-default-terminal/>
and <https://ubuntuhandbook.org/index.php/2025/08/install-set-ptyxis-as-default-terminal-in-ubuntu-24-04-22-04/>

# Set to default in ubuntu <= 25.04

```sh
test -f ~/.config/ubuntu-xdg-terminals.list && cp ~/.config/ubuntu-xdg-terminals.list ~/.config/ubuntu-xdg-terminals.list.bak
echo "Alacritty.desktop" > ~/.config/ubuntu-xdg-terminals.list
```

See also <https://ubuntu.com/desktop/docs/en/26.04/how-to/change-the-default-terminal/>
