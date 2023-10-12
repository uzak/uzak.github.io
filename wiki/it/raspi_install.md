Add public key to:

`.ssh/authorized_keys`

enable ssh in `/etc/ssh/sshd_config`

    sudo systemctl restart ssh
    
latest kernel

    sudo rpi-update
    
# Packages

    sudo apt install zsh autojump
    sudo apt install tig ack fzf
    sudo apt install tmux mc jq fd-find tldr
    sudo apt install newsboat
    sudo apt install neofetch
    sudo apt install docker.io
    
# Setup

    sudo cfdisk /dev/sda
    sudo fdisk -l /dev/sda
    sudo mkfs.ext4 -L DATA /dev/sda3
    sudo mkdir -m 1777 /data
    sudo mount -L DATA /data
    
    ➜  ~ grep DATA /etc/fstab 
    LABEL=DATA	/data	ext4	defaults,noatime	0	1
    
Install MTA
    
    sudo apt install postfix bsd-mailx
    
## Samba

    sudo apt-get install samba samba-common-bin
    
    /etc/samba/smb.conf
    [data] 
    Comment = Pi DATA shared folder 
    Path = /data 
    Browseable = yes 
    Writeable = yes 
    only guest = no 
    create mask = 0600
    directory mask = 0700
    Public = no 
    Guest ok = no
    
    [homes]
    browseable = yes
    read only = yes
    
    sudo smbpasswd -a m
    sudo service smbd restart

On client

    sudo apt install smbclient cifs-utils
    smbclient -L //pi
    
    sudo mkdir /mnt/pi
    vi ~/.smbpass
        username=XXX
        password=XXX
    
    sudo mount -t cifs -o credentials=/home/m/.smbpass //192.168.0.129/data /mnt/pi
    
    vi /etc/fstab
        //pi/data	/mnt/pi	cifs	rw,user,credentials=/home/m/.smbpass
        

## Rclone and Dropbox

Just download: [source](https://jarrodstech.net/how-to-raspberry-pi-dropbox-sync/)

    sudo apt-get install rclone
    rcone config
        n
        dropbox
        8
        ENTER
        ENTER
        n
        y
        open link and enter credentials
        y
        q
    crontab -e
        */15 * * * * rclone --bwlimit 1M sync dropbox: /home/m/Dropbox
        
Two way sync: [source](https://www.ralphminderhoud.com/blog/rclone-two-way-dropbox-sync/)
Alternative: https://github.com/cjnaz/rclonesync-V2. First get latest rclone:

    git clone https://github.com/cjnaz/rclonesync-V2
    sudo apt install unzip
    wget https://downloads.rclone.org/rclone-current-linux-arm.zip
    unzip -j -d rclone-temp rclone-current-linux-arm.zip
    sudo cp rclone-temp/rclone /usr/local/bin

## Mp3

on client:

    rclone config   # add sftp endpoint for sftp-pi
    ...
    rclone -v copy ~/Music sftp-pi:Music
    
## Blog
