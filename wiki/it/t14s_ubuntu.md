# Install

* normal installation
* use disk encryption
* disk layout
    * 1GB /boot/efi
    * / encrypted

## Basic system

    sudo sh -c "echo \"$USER ALL=NOPASSWD: ALL\" >> /etc/sudoers"
    
    $ cat > /etc/environment

    LC_ALL=en_US.UTF-8
    EDITOR=vi
    
    sudo paperconfig -p a4
    sudo apt install python3-gpg
    
    xdg-settings set default-web-browser firefox_firefox.desktop
    gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
    gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
    
    # fix mic
    echo -e "snd-pci-ps\nsnd-soc-ps-mach" | sudo tee /etc/modules-load.d/sound.conf > /dev/null
    # audible -> visual bell 
    gsettings set org.gnome.desktop.wm.preferences audible-bell false
    gsettings set org.gnome.desktop.wm.preferences visual-bell false
    
    # turn off power button led
    echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/leds/tpacpi::power/brightness
    
* Add fingerprint to the user
* Dropbox

## Basic tools


```sh
sudo apt update
sudo apt dist-upgrade

sudo apt install -y zsh catimg autojump        # zsh + tools for plugins
sudo apt install -y vim neovim 
sudo apt install -y git tig universal-ctags cloc bat ack fzf ripgrep cscope  make
sudo apt install -y jq csvtool
sudo apt install -y tmux mc tree curl net-tools fd-find tldr iproute2
sudo apt install -y iotop iftop htop bmon
sudo apt install -y net-tools iproute2 host iputils-tracepath traceroute
sudo apt install -y gimp geeqie
sudo apt install -y mpv
sudo apt install -y python3 python3-pip pipenv python3-sphinx ipython3
sudo apt install -y pass gnupg upass pwgen
sudo apt install -y aria2 yt-dlp
sudo apt install -y neofetch 
sudo apt install -y nodejs node-typescript yarnpkg npm
sudo apt install -y colordiff
sudo apt install -y plantuml 
sudo apt install -y libreoffice libreoffice-gnome
sudo apt install -y mythes-sk libreoffice-l10n-sk hyphen-sk
sudo apt install -y texlive-fonts-recommended texlive-latex-recommended 
sudo apt install -y pandoc texlive-latex-base texlive-xetex
sudo apt install -y fonts-firacode fonts-ibm-plex
sudo apt install -y fonts-ancient-scripts 
sudo apt install -y hugo
sudo apt install -y autoconf make
sudo apt install -y gnome-tweak-tool


sudo apt autoremove
```

* Install chrome
* Import gpg key
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
~/repos/dotfiles/install.sh
```
* Activate Firefox Sync
    

# Snap

    sudo snap install insomnia 
    sudo snap install slack
    sudo snap install dbeaver-ce
    sudo snap install chromium
    sudo snap install thunderbird
    sudo snap install --classic codium
    sudo snap install --classic aws-cli
    sudo snap install --classic webstorm
    sudo snap install --classic pycharm-professional
    sudo snap install asciiquarium
    
* codium
    Install Vim lugin
* Add pycharm license
* Plugins PyCharm
    * IdeaVim
    * .ignore
    * EnvFile
    * Github Copilot
    * Makefile
    * Terraform and HCL
* Plugins WebStorm
    * IdeaVim

        
## Docker
    
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -aG docker ${USER}
    sudo apt install docker-compose
    
    
## Misc
    
    sudo apt install libstfl0 
    cd ~/Downloads
    wget http://de.archive.ubuntu.com/ubuntu/pool/universe/n/newsboat/newsboat_2.32-3_amd64.deb
    sudo dpkg -i newsboat_2.32-3_amd64.deb
    
### Work

* Slack
* Mail
* Google Chrome profile


#### Deadsnakes
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install python3.10 python3.10-venv python3.10-dev
    mkdir ~/.virtualenvs
    python3.10 -m venv ~/.virtualenvs/thor3.10
    ln -s ~/.virtualenvs/thor3.10 ~/.virtualenvs/thor

    
### Repos
    https://prontohousing.atlassian.net/wiki/spaces/ENG/pages/1036582997/Setting+Up+Your+Development+Environment
    sudo apt install postgresql-16 redis
    mkdir ~/development
    cd ~/development
    for repo in pronto-thor pronto-loki sam_events_system sam-inbound-email sam_sms sam_forms housing_connect sam-questionnaire-file-upload sam_printers devops daily-maintenance; do 
        git clone git@github.com:prontohousing/${repo}.git;
    done
    
### Thor
    sudo apt install libheif-dev python3-psycopg2 libpq-dev libffi-dev
    cd ~/development/pronto-thor
    thor
    # copy/create project_env.sh
    pip install -r requirements/production.txt
    pip install -r requirements/development.txt
    
## VimPC

```
cd ~/repos
git clone https://github.com/boysetsfrog/vimpc
sudo apt install -y libcurl4-gnutls-dev libpcre3-dev 
sudo apt install -y build-essential autoconf \
    libmpdclient2 libmpdclient-dev libpcre3 libpcre3-dev \
    libncursesw6 libncurses-dev \
    libtag1v5 libtag1-dev
cd vimpc
./autogen.sh
./configure
make -j 8
sudo make install clean
```

### TODO 

WhatsApp
Telegram
Insomnia
PostMan??
