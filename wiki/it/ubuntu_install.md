# Contents

- [Install](#Install)
- [Sudo](#Sudo)
- [Environment](#Environment)
- [Basic tools](#Basic tools)
- [zsh](#zsh)
- [firefox](#firefox)
- [Slack](#Slack)
- [Snap](#Snap)
- [Docker](#Docker)
- [vimpc](#vimpc)
- [Jekyll/blog](#Jekyll/blog)
- [Misc](#Misc)
    - [Mute beeping](#Misc#Mute beeping)
    - [Dispable touchpad](#Misc#Dispable touchpad)
    - [Battery](#Misc#Battery)
        - [Marble mouse](#Misc#Battery#Marble mouse)

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

    sudo apt update
    sudo apt dist-upgrade
    sudo apt install -y zsh catimg autojump        # zsh + tools for plugins
    sudo apt install -y vim neovim 
    sudo apt install -y git tig universal-ctags cloc bat ack fzf ripgrep cscope
    sudo apt install -y tmux mc tree curl net-tools jq fd-find tldr
    sudo apt install -y iotop iftop htop bmon
    sudo apt install -y gimp geeqie 
    sudo apt install -y gnome-mpv mpv
    sudo apt install -y gnome-tweaks gnome-shell-extension-suspend-button
    sudo apt install -y python3 python3-pip pipenv python3-sphinx ipython3
    sudo apt install -y pass gnupg upass 
    sudo apt install -y newsboat
    sudo apt install -y aria2
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
    
    sudo apt autoremove

# zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    
# firefox

    xdg-settings set default-web-browser firefox_firefox.desktop
    
# Slack 

Install manually and not from snap. Snap is slower and has problem opening links in firefox once it is running. [Download](https://slack.com/intl/en-cz/download), install and then run:

    sudo apt --fix-broken install

# Snap

    sudo snap install insomnia 
    sudo snap install --classic chromium
    sudo snap install --classic skype
    sudo snap install --classic code
    sudo snap install --classic kotlin
    sudo snap install --classic pycharm-community
    sudo snap install --classic intellij-idea-community
    sudo snap install asciiquarium


# Docker
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo -E add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update
    sudo apt install docker-ce
    sudo systemctl status docker
    sudo usermod -aG docker ${USER}
    sudo apt install docker-compose

# vimpc

    cd ~/repos
    git clone https://github.com/boysetsfrog/vimpc
    sudo apt install -y libcurl4-gnutls-dev libpcre++-dev 
    sudo apt install -y build-essential autoconf \
        libmpdclient2 libmpdclient-dev libpcre3 libpcre3-dev \
        libncursesw5 libncursesw5-dev libncurses5-dev \
        libtagc0 libtagc0-dev
    cd vimpc
    ./autogen.sh
    ./configure
    make -j 8
    sudo make install clean
    
    sudo apt install -y mpd mpc
    sudo service mpd stop
    sudo update-rc.d mpd disable

    
# Jekyll/blog

    sudo apt -y install ruby-dev ruby-bundler
    cd ~/repos/blog
    bundler install
    bundle exec jekyll serve
    
    gem install vimwiki_markdown        # for vimwiki
    
# Misc

## Mute beeping

    sudo apt install dconf-editor
    dconf-editor
    
Then go to `org/gnome/desktop/sound` and disable `event-sounds`.


## Dispable touchpad
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
