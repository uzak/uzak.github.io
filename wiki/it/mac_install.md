# brew

    brew install htop
    brew install speedtest-cli
    brew install tmux
    brew install zsh fzf autojump
    brew install coreutils          # for realpath fct
    brew install neovim
    brew install gpg gpg2 pinentry-mac pass
    brew install newsboat
    brew install fd ack git-delta rg
    brew install tig
    brew install npm yarn node
    brew install grep
    brew install ffmpeg
    brew install cloc
    brew install bandwhich iftop bmon
    brew install pandoc
    brew install inetutils
    brew install basictex texlive
    brew install mpd vimpc mpc
    brew install yt-dlp
    brew install awscli docker-buildx
    brew install awslogs
    brew install go hugo
    brew install gnu-sed 
    brew install pv
    # brew install stats


## Cask 

    brew install --cask pycharm-ce docker insomnia 
    brew install --cask google-chrome firefox
    brew install --cask telegram-desktop slack whatsapp
    brew install --cask dropbox
    brew install --cask iterm2
    brew install --cask mpv
    brew install --cask easy-move-plus-resize
    brew install --cask libreoffice
    brew install --cask gimp
    brew install --cask basictex
    brew install --cask vscodium && xattr -r -d com.apple.quarantine /Applications/VSCodium.app
    brew install --cask meetingbar
    brew install --cask dbeaver-community
    
### Sudo

    sudo dseditgroup -o edit -a $USER -t user admin
    sudo dseditgroup -o edit -a $USER -t user wheel

Adapt `/etc/sudoers` to:

    %admin		ALL = (ALL) NOPASSWD: ALL

