# tcpdump

To monitor HTTP traffic including request and response headers and message body:

    tcpdump -A -s 0 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'
    

monitor and dump all trafic from a host:

    sudo tcpdump ip host 192.168.1.180 -vv
    
misc: 

    sudo tcpdump -A -s 0 'tcp and host 192.168.1.217  and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'
