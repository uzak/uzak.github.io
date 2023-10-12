
    # scan range
    nmap 192.168.1.113-116
    
    # nmap info scan
    sudo nmap -sU -p 161 --script=snmp-info 192.168.1.113
    # run all scripts
    sudo nmap -sU -p 161 -sV -sC 192.168.1.113

