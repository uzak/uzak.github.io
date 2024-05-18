# Contents

- [Install](#install)
- [Sudo](#sudo)
- [Environment](#environment)
- [Basic tools](#basic-tools)
- [zsh and dotfiles](#zsh-and-dotfiles)
- [firefox](#firefox)
- [Slack](#slack)
- [Snap](#snap)
- [Docker](#docker)
- [Misc](#misc)
    - [Mute beeping](#mute-beeping)
    - [Disable touchpad](#disable-touchpad)
    - [Battery](#battery)
        - [Marble mouse](#marble-mouse)

# Install

* normal installation
* use disk encryption
* disk layout for dual boot:
    * 1GB /boot
    * 100 MB efi (already created by windows)
    * / encrypted

# Sudo

    sudo -E visudo
    sudo sh -c "echo \"$USER ALL=NOPASSWD: ALL\" >> /etc/sudoers"
     
# Environment

    $ cat /etc/environment

    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

    LC_ALL=en_US.UTF-8
    EDITOR=vi
    
    $ sudo paperconfig -p a4

# Basic tools


```sh
sudo apt update
sudo apt dist-upgrade
sudo apt install -y zsh catimg autojump        # zsh + tools for plugins
sudo apt install -y vim neovim 
sudo apt install -y git tig universal-ctags cloc bat ack fzf ripgrep cscope # git-delta
sudo apt install -y tmux mc tree curl net-tools jq fd-find tldr iproute2
sudo apt install -y iotop iftop htop bmon
sudo apt install -y gimp geeqie 
sudo apt install -y gnome-mpv mpv
sudo apt install -y gnome-tweaks
sudo apt install -y python3 python3-pip pipenv python3-sphinx ipython3
sudo apt install -y pass gnupg upass 
sudo apt install -y newsboat
sudo apt install -y aria2 youtube-dl
sudo apt install -y neofetch 
sudo apt install -y influxdb-client
sudo apt install -y nodejs node-typescript
sudo apt install -y colordiff
sudo apt install -y csvtool
sudo apt install -y lm-sensors
sudo apt install -y plantuml asciio         # drawio
sudo apt install -y mythes-sk libreoffice-l10n-sk hyphen-sk
sudo apt install -y texlive-fonts-recommended texlive-latex-recommended 
sudo apt install -y pandoc texlive-latex-base texlive-xetex
# sudo apt install -y neomutt w3m isync msmtp urlscan ripmime mime-support 
# sudo apt install -y postix mailutils       # local mail cfg
sudo apt install -y fonts-firacode
sudo apt install -y fonts-ancient-scripts 
sudo apt install -y httpie exa
sudo apt install -y traceroute
sudo apt install -y pwgen
sudo apt install -y hugo
sudo apt install -y autoconf
sudo apt install -y mpd mpc
sudo apt install -y yarnpkg npm
sudo apt install -y awscli

sudo apt install ttf-mscorefonts-installer
ln -s ~/Dropbox/backup/fonts ~/.fonts


# fingerprint magic
sudo add-apt-repository ppa:uunicorn/open-fprintd   
# s/lunar/kinetic:
# sudo vi /etc/apt/sources.list.d/uunicorn-ubuntu-open-fprintd-lunar.list
sudo apt install open-fprintd fprintd-clients python3-validity

sudo apt autoremove
```

# zsh and dotfiles

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ~/repos/dotfiles/install.sh
    # import gpg key
    
# firefox

    xdg-settings set default-web-browser firefox_firefox.desktop
    
# Slack 

Install manually and not from snap. Snap is slower and has problem opening links in firefox once it is running. [Download](https://slack.com/intl/en-cz/download), install and then run:

    sudo apt --fix-broken install

# Snap

    sudo snap install insomnia 
    sudo snap install slack
    sudo snap install dbeaver-ce
    sudo snap install chromium
    sudo snap install --classic codium
    sudo snap install --classic aws-cli
    sudo snap install --classic webstorm
    sudo snap install --classic pycharm-professional
    sudo snap install asciiquarium

# Docker
    
    sudo apt install docker.io docker-compose
    sudo usermod -a -G docker $USER

# Misc

## Mute beeping

    sudo apt install dconf-editor
    dconf-editor
    
Then go to `org/gnome/desktop/sound` and disable `event-sounds`.


## Disable touchpad
https://askubuntu.com/questions/1085390/how-do-i-disable-the-touchpad-while-typing-ubuntu-18-04

    sudo apt remove xserver-xorg-input-synaptics
    sudo apt install xserver-xorg-input-libinput

## Battery

    sudo apt-get install tlp tlp-rdw acpi-call-dkms tp-smapi-dkms acpi-call-dkms
    sudo tlp start
    tlp-stat -s
    sudo tlp-stat -b
    
    
### Marble mouse

https://unix.stackexchange.com/questions/367106/logitech-marble-mouse-linux-scroll-modifier-setup
