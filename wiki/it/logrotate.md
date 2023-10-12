https://www.tecmint.com/install-logrotate-to-manage-log-rotation-in-linux/


    logrotate -d /etc/logrotate.d/syslog    # test

Installed through `/etc/cron.daily/logrotate`. Comment out systemd timer check. Make sure `/etc/logrotate.conf` has enabled:

    include /etc/logrotate.d

