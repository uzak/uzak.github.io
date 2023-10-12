
    # https://l3net.wordpress.com/2013/05/12/installing-net-snmp-mibs-on-ubuntu-and-debian/
    sudo apt install snmp
    sudo apt-get install snmp-mibs-downloader
    sudo download-mibs
    
    wget https://assets.aten.com/product/driver/PE_MIB_File_v1.1.115.zip
    unzip ...
    
    cd /home/martin_uzak/PE_MIB_1.1.115
    wget https://raw.githubusercontent.com/librenms/librenms/master/mibs/junose/rfc1158.mib -o RFC-1158.mib
    wget http://www.circitor.fr/Mibs/Mib/R/RFC1215-MIB.mib -o RFC-1215.mib
    wget http://www.circitor.fr/Mibs/Mib/R/RFC1212-MIB.mib -o RFC-1212.mib
    
    mibdump.py --mib-source=/home/martin_uzak/PE_MIB_1.1.115 --mib-source=/var/lib/snmp/mibs/ietf/ ATEN-PE-CFG_int
    
    https://github.com/mtdcr/pductl
