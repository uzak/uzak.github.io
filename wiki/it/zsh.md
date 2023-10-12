# Zsh

    if you want an arbitrary argument, you can use !!:1, !!:2, etc. (!!:0 is the previous command itself.

http://zsh.sourceforge.net/Doc/Release/zsh_toc.html#SEC_Contents

* `n=${f##*dv}` - strip everything until dv (prefix) and assign to n 
* `${n%%.*}` - strip everything until . (suffix) and assign to n
  
    ~ a=abcd123.png ; echo ${a##*bc};
    d123.png
    ~ a=abcd123.png ; echo ${a%%png};
    abcd123.
    
* `C-x C-e` calls $EDITOR

## Plugins

all [documentation](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

    cd /u/lo/li<TAB>        # autcompletes /usr/local/lib

### autojump

    j foo                   # jump to a directory that contains foo
    jo foo                  # open a file explorer 
    autojump -s             # stats
    
### common-aliases

    # long listing by creation time
    lt          # ls -ltFh  
    
    l           # ls -lFh (long, classify files, human readable)
    la          # ls -lAFH (allmost-all [not `.` and `..`], follow-symlinks)
    lr          # ls -tRFh (by mod. time, recursive)
    ll          # ls -l
    ldot        # ls -ld .*
    lS          # ls -1FSsh (one line pre line, sort by filesize, size)
    lart        # ls -1Fcart (sort by ctime) 
    lrt         # ls -1Fart 
    h           # history
    p           # processes for current user
    
end of command aliases:
    
    L           # | less
    LL          #  2>&1 | less
    G           # | grep
    NE          #  2> /dev/null
    NUL         #  > /dev/null 2>&1
    
    H           # | head
    T           # | tail
    M           # | most
    CA          #  2>&1 | cat -A
    P           #  2>&1 | pygmentize -l pytb

### copyfile

    copies content of a file into clipboard
    
### jsontools

    pp_json         # pretty print json
    is_json         # returns true if valid json; false otherwise
    
### pass

[autocompletion doesn't work](https://github.com/ohmyzsh/ohmyzsh/issues/7864):

    rm ~/.zcompdump* 
    exec zsh                    # restart zsh
    
### websearch

    google query
    duckduckgo query
