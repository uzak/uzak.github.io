minicom -b 115200 -D /dev/ttyAMA0

CTRL-A E    # turn on local echo

```
$ cat .minirc.dfl 
# Machine-generated file - use setup menu in minicom to change parameters.
pu localecho        Yes
pu addlinefeed      Yes
pu linewrap         Yes
pu addcarreturn     Yes
```
