apt install sysstat

https://www.thegeekstuff.com/2011/03/sar-examples/

https://www.howtoforge.com/install-and-configure-sar-and-ksar-for-daily-monitoring-on-linux-and-generate-pdf-reports/

Visualize:
* https://sarchart.dotsuresh.com/
* https://sourceforge.net/projects/ksar/

/etc/default/sysstat:

    ENABLED="true"
    

Enable:

    ➜  ~ sudo systemctl start sysstat
    ➜  ~ sudo systemctl enable sysstat

