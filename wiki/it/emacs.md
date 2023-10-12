# Emacs!

    $ emacs -q          # start with a different config file
    
    C-;                     # iedit

[EmacsWiki/SetFonts](https://www.emacswiki.org/emacs/SetFonts)

    C-x C-+                     # increase font size
    C-x C--                     # decrease font size
    
    C-x C-c                     # quit emacs
    C-g                         # cancel
    ESC ESC ESC                 # all purpose get out command
    M-x                         # execute extended command
    C-h ?                       # HELP
    C-h t                       # tutorial
    C-h r                       # manual
    C-h k + keymap              # documentation on keymap
    C-h m                       # help with the current mode
    C-h v                       # help on variable name
    C-h f                       # describe function
    C-h i                       # read included manuals
    
    C-v                         # scroll down
    M-v                         # scroll up
    C-l                         # clear screen (1x center, 2x up, 3x down)
    C-p                         # prev. line
    C-n                         # next. line
    C-f                         # right
    C-l                         # left
    M-f                         # next word (forwards)
    M-b                         # prev word (backwards)
    C-a                         # move to the beginning of line
    C-e                         # move to the end of line
    M-a                         # move to the beginning of sentence
    M-e                         # move to the end of sentence
    M-<                         # beginning of document
    M->                         # end of document
    
    M-u                         # uppercase next word
    C-u N                       # repeat next command n-times
    
    C-x C-f                     # find a file
    
    C-s                         # search
    C-r                         # reverse search
    C-s C-n                     # next item in search history
    C-s C-p                     # previous item in search history
    M-%                         # search and replace (y, n, q, ., !)
    C-M-s                       # regexp search
    M-x replace-regexp
    
    F3                          # start recording macro
    F4                          # stop recording macro
    F4                          # play
    
    M-x shell
    M-x calendar
    M-! shell-command           # execute a shell command
    M-| shell-command           # execute a cmd and pipe into current region
    
    # VCS
    C-x v =                     # show diff of changes to current file
    C-x v g                     # blame"
    C-x v l                     # log of changes
    
    M-x server start
    emacsclient -t filename
    
    M-x java-mode
    M-x flyspell-mode           # minor mode: autospell
    M-x follow-mode             # minor mode: one buffer -> two columns
    
    C-x o                       # focus other window
    C-x 0                       # kill current window
    C-x 1                       # hide all other windows
    C-x 2                       # horizontal split
    C-x 3                       # vertical split
    C-x 52                      # open a new frame
    C-x 50                      # close a frame
    C-M-v                       # scroll the bottom window
    C-x 4 C-f                   # open a file in a new bottom window
    
    C-x b                       # switch buffer (type ? for minibuffer)
    C-x C-b                     # list buffers
    C-x k                       # kill buffer
    
    C-x s                       # save all buffers
    C-x C-s                     # save buffer
    
    C-x f                       # set auto fill column (interactive)
    C-u 70 C-x f                # set auto fill column to 70
    M-q                         # re-fill the paragraph
    
    M-g g                       # goto line
    
    C-SPC                       # set mark
    C-x C-x                     # swap point and mark (= region)
    C-u C-SPC                   # cycle through mark ring
    M-h                         # mark region with current paragraph
    C-x h                       # mark all buffer
    C-x n n                     # narrow current region
    C-x n w                     # widden current region
    C-w                         # kill current region
    M-w                         # copy current region
    M-d                         # kill next word
    M-k                         # kill to end sentence
    
    C-y                         # yank (paste) last killed text
    M-y                         # replace yanked text w. previously killed one
    
    M-/                         # autocompletion
    
## Packages

    M-x try                         # try package
    M-x describe-package
    M-x package-refresh-contents

    
## Elisp functions

    (previous-line N)
    (setq var val)
    (+ M N ...)
    (tool-bar-mode 1)
