# UNIX 


use `tldr` to get basic info on cmds

## User Mgmt

gen a pw

    tr -dc A-Za-z0-9_ < /dev/urandom | head -c 16 | xargs

add user:

    adduser USERNAME
    
    useradd -m USERNAME     # add and create $HOME
    
add user to unix group:

    sudo usermod -a -G dialout m
    sudo usermod -a -G sudo m
    
remove an user from a group:

    sudo deluser $USER group

disable user

    usermod -L pi
    
enforce password change after login

    passwd -e $USER
    
### sudo

allow user to do stuff:

    michal_rudolf ALL=(ALL) NOPASSWD: /usr/sbin/tcpdump
    
## Package Mgmt

### DEB

apt-get for cygwin: http://dev.lab427.net/apt-cyg.html

    dpkg -S `which mysqldump`           # show to which pkg belongs given file
    dpkg -x ipp-linux_1.68.165-1_amd64.deb ipp
    

Upgrade to new release

check `/etc/update-manager/release-upgrades` for `Prompt=normal`

    sudo apt update
    sudo apt dist-upgrade
    sudo do-release-upgrade -d            # -d: development release
    sudo apt --fix-broken-install         # after dpkg if it fails
    sudo apt --install-suggests PACKAGE
    
use `sudo apt autoremove` instead of `sudo apt uninstall` to get rid also of unused dependencies.

    sudo apt autoclean
    sudo apt clean

    sudo apt install debfoster
    sudo debfoster
    


### RPM

    yum provides /usr/bin/ab
    
    sudo yum install /usr/bin/ab
    
    yum search all <search terms>
    
    
## Networking
        
fuser

    fuser 5000/tcp              # what process is listening on a port?
    sudo fuser 5000/tcp -k      
    
show network settings:

    nmcli device show
    
show configured dns:
        
    nmcli dev show | grep IP4.DNS
    
[[tcpdump](tcpdump)]
    
## Service Mgmt    

### systemctl

    sudo systemctl list-units --type=service --state=enabled,disabled --state=running
    
    sudo systemctl disable --now SERVICE
    
    systemctl                               # list units
    sudo systemctl stop redis-server        # stop an unit
    systemctl status redis-server   
    sudo systemctl disable redis-server 
    
    sudo update-rc.d mpd disable
    
    ps -fu                                  # (f)ull, (u)userlist
    loginctl list-users
    loginctl enable-linger m
    
    systemctl --user 
    systemctl --user start mpd
    systemctl --user daemon-reload          # on config change
    
    systemctl restart rsyslog
    
## Misc

LVM resize

    lsblk
    cfdisk /dev/sda         # extend, write and quit
    pvresize /dev/sda3
    lvresize -t -v -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
    resize2fs /dev/ubuntu-vg/ubuntu-lv
    
[home router](https://www.ascinc.com/blog/linux/how-to-build-a-simple-router-with-ubuntu-server-18-04-1-lts-bionic-beaver/):

    sudo ufw enable
    #sudo ufw loggin on
    
    sudo $EDITOR /etc/netplan/*yaml
    sudo netplan generate
    sudo netplan apply
    sudo apt-get install isc-dhcp-server
    sudo vi /etc/dhcp/dhcpd.conf 
    sudo systemctl restart isc-dhcp-server
    sudo systemctl enable isc-dhcp-server
    sudo systemctl status isc-dhcp-server    
    sudo vi /etc/ufw/sysctl.conf        # enable net/ipv4/ip_forward=1
    # create /etc/rc.local with firewall rules -> systemctl?
        # flush it initially?
    
    
epub to pdf convert:

    https://askubuntu.com/questions/299747/converting-epub-files-to-pdf-format
    
    
youtube-dl 403:

    youtube-dl --rm-cache-dir
    
    
ffmepg

    # Cut off first 10 seconds:
    ffmepg -ss 00:00:10 -i input.file output.file
    
    # Reduce size of mp4
    ffmpeg -i input.file -vcodec libx265 -crf 30 output.file
    
xz

    xz -9 -T2 -v some.tar
    
    
## Ubuntu

[vpn](vpn)
    
bootable usb:

    https://github.com/jsamr/bootiso
    
fractional scaling:

    # wayland
    gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" 
    
    # xorg
    gsettings set org.gnome.mutter experimental-features "['x11-randr-fractional-scaling']"
    
android remote:

     https://www.fossmint.com/scrcpy-mirror-control-android-from-ubuntu/
     
reconfigure gdm

    sudo dpkg-reconfigure gdm3
    
boot logo ubuntu:

    sudo update-alternatives --config default.plymouth
    sudo update-initramfs -u
    
