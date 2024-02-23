route
nstat
netstat -s          # stats

ip route            # just as route
ip -s -h a show     # address: statistics (-s) in human readable format (-h)
ip -s -h n show     # arp: stats

ss
ss -s               # stats (-s)
ss -t               # tcp only. UDP (-u), UNIX (-u)
ss dst 10.0.0.77    # established connections to ...
ss -l               # listening sockets
ss -tnlp            # show processes that are bound to listening sockets

apt install iputils-tracepath
tracepath 10.0.0.77
