# Vim

Some commands:
  
    ZQ                                      # force quit in cmd mode
    da[                                     # delete around bracket
    gn                                      # select until next match
    <c-y> copy character from line above
    gU<motion                               # uppercase <motion>
    gu<motion                               # lowercase <motion>

    :ls                                     # list buffers
    :vert sb N                              # open buffer N in a vertical split
    :sb N                                   # open buffer N in a horizontal split
    :tab sb[bufferId]                       # open existing buf. in new tab
    
    :verbose set modeline? modelines?       # show variables' values
    V=                                      # visual select + reformat (=)
    
    ]p      # paste under the current indentation level
    gf      # goto file in cursor
    [m      # previous method 
    ]m      # next method 
    :e      # reload file
    K       # show help for a command

    
## Modelines

    vim: spell spelllang=en,de

## Plugins 

### [fzf](fzf)

https://github.com/junegunn/fzf

    <ctrl-v> opens in a vertical split
    <ctrl-t> opens in a tab
    :Files!                                 # opens dialog in fullscreen
    :Helptags
    :Buffers
    :Lines
    :Rg
    :BLines
    :BTag
    :Tags
    :History

## Goto commands
    gx          open URL under cursor in a browser
    gf          open file under cursor
    <c-w>f      open file under cursor in new window
    <c-w>gf     open file under cursor in new tab
    gd          goto local definition

## Maps

    :nmap       (display) normal mode maps
    :imap       (display) insert mode maps
    :vmap       (display) visual and select mode maps
    :xmap       (display) visual mode maps
    :cmap       (display) command-line mode maps
    :omap       (display) operator pending mode apps

## Cursor movement

    H       # move to the top of screen
    M       # move to the top of screen
    L       # move to the bottom of screen

### Words

    w       
    W       # start of a word (by whitespace)
    b       # start of a word backwards
    B       # start of a word backwards (by whitespace)
    e       
    E       # the end of a word (by whitespace)
    ge      # previous end of a word
    gE      # previous end of word (by whitespace)
    + down to first non-blank charater of line
    
### Line    
    
    0       # start of line
    ^       # first non-black character of a line
    $       # 
    g_      # last non-black character of a line
    gg      
    G
    5G      # line 5
    :n

### Character

    fx      # next occurrence of 'x'
    tx      # before next occurrence of 'x'
    Fx      # previous occurrence of 'x'
    Tx      # after previous occurrence of 'x'
    ;       # repeat last t/f command
    
### Paragraph 

    }       # next paragraph (function, block)
    {       # previous paragraph (function, block)
    %       # next bracket (or closing bracket)
    
### Window / Scrolling
    
    zz      # center cursor
    zg      # go back
    zt      # top this line
    C-b     # page up (back)
    C-f     # page down (forward)
    C-d     # 1/2 page down
    C-u     # 1/2 page up
    C-e     # move screen one line down
    C-y     # move screen one line up
    
## Visual Mode

    v
    V       # linewise mode
    o       # move to the other end of marked area
    C-v     # blockwise mode
    O       # move to the other corner of block
    
    
## Insert / append

    i
    I
    a
    A
    o
    O       # append a new line above the current line
    ea      # insert at the end of the word
    
## Editing

    r
    J
    gJ      # join lines without a space in between
    gwip    # reflow paragrah
    cc      # replace entire line
    C
    D       # delete until the end line
    s       # delete character and substitute text
    ciw     # change entire word
    cw
    u
    C-r
    

## Search and replace

    /pat
    ?pat            # search backwards
    [count]n        # count-th match forwards 
    [count]N        # count-th match backwards
    :%s/old/new/g
    :%s/old/new/gc  # replace with confirmations
    :noh            # remove highlighting of matches
    *
    #              
    
## Search in multiple files

    :vimgrep /foo/ **/*         # search for pattern in multiple files
    :cn                         # jump to next match
    :cp                         # jump to previous match
    :copen                      # open a window w. matches 
    
## Working with multiple files

* Buffers are file proxies.
* Windows are buffer viewports.
* Tabs are not tabs - tabs are window containers.

    :e file         # edit a file in a new buffer
    :bn             # next buffer
    :bp             # previous buffer
    :ls             # list open buggers
    :sp file        # split window
    :vsp file       # split window vertically
    :20vs .         # open a netrw file browser in a vertical split of 20 chars
    
### Buffers

    ctrl-^          # switch buffers
    ctrl-6          # switch buffers
    
    :bn             # next buffer
    :b {filename}   # goto buffer
    :bd             # delete current buffer
    :buffers
    :bufdo {cmd}    # execute {cmd} for all buffers
    :bo 15sp +te    # open a buffer object as a 15 lines split with a terminal (nvim)

### Windows

    ctrl-w r        # rotate windows
    ctrl-w q        # close window
    :sf             # split window and :find {FILE}
    :vert           # make split be vertical
    
### Tabs

    :tabnew
    gt / :tabn[ext] # next tab
    gT / :tabp[rev] # prev tab
    ctrl-pagedown   # next tab
    ctrl-pageup     # prev tab
    1gt             # move to tab 1
    :tabmove 5      # move current tab to 5th pos (indexed from 0)
    :tabc[lose]     # close tab
    :tabo[nly]      # close all tabs except current one
    :tabfirst       # first tab
    :tablast        # last tab
    :tabs
    
## Registers

    :reg    # show registers
    "xy     # yank into register x
    "xp     # paste register x
    
## Marks

Bookmarks:

    :marks      # list marks
    ma          # set current position for mark A (valid ``a-zA-Z``)
    `a          # jump to position of mark A
    y`a         # yank until mark A
    `'          # jump to last change/position?

## Tags
    ctrl-]
    g-ctrl-]
    ctrl-t

    
## Jumplist / Changelist
    :jumps
    ctrl-o / ctrl-i     # cycle through :jumps
    :changes
    g; / g,             # cycle trough :changes

## Args

    :args               # files passed to  vim as arguments
    :arga               # add {filename} to arglist
    :argl               # make a local arg copy
    :n                  # goto next file

    :sa                 # split all
    :vert sa
    :args ...
    :windo difft        # do for all windows diffthis
    :vim {pat} {file}   # vimgrep for pattern in file (% - cur file)
    :cn                 # quick-fix next
    ##                  # everything in my argument list


## Folds

    zM      # close all folds  
    zR      # open all folds  
    za      # toggle open/close fold  
    
## Operators

d (operator) w (motion)

    d
    y
    c
    >
    <
    g~      # swap case
    gU      # uppercase
    gu      # lowercase
    =       # indent
    !       # filter through external program

## Text objects

v (operator) i/a/t// (inside/outside/till given char/till given phrase) p (text object)

    p           paragraph
    w           word
    s           sentence
    [ ( { <     a [], (), {}, <> block
    ' " `       a quoted string
    b           a block (bracket) [(
    B           a block (bracket) [{
    t           a XML tag block

Examples:

    vip         # select paragraph
    yit         # yank the content of a tag
    ciw         # change word
    da'         # delete everything between previous and next '
    y/foo       # yank everything until the next `foo`
    
    
## Spell checking

    :set spell spelllang=en_us
    ]s                              # next misspelled word
    [s                              # previous misspelled word
    z=
    zg                              # add word to the spell list (good)
    zw                              # mark word as bad
    :help spell
    
## Text alignment

    :center [width]
    :right [width]
    :left

## Misc

Start with a different [vimrd](vimrd):

    vim -u other.vimrc
    
Start vim with a command:

    vim -c VimwikiIndex
    
## Macros

    q<letter><commands>q        # to enter a macro
    <number>@<letter>           # execute the macro, number is optional
