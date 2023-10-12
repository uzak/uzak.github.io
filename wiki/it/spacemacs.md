https://www.youtube.com/watch?v=fdLCuJcS2Aw

# Setup

    sudo apt install emacs
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

answer setup questions:

* vim
* spacemacs
* helm

Adapt .spacemacs

# Shortcuts

    space-f-f           # find
    space zf            # zoom
    space cl            # uncomment a line
    space pf            # search for a file in entire project
    ctrl g              # cancel
    space pt            # tree view of your project
    space w             # window commands
    space ji            # all the symbols in the current file
    * /                 # on a symbol: project wide search
    
For navigation in modal buffers handling `hjkl` as normal key, use ctrl+`hjkl`.

    space b             # buffer commands
    space bh            # home 
    space bn            # next
    space bp            # next
    space bs            # scratch
    space bb            # overview
    
# Docs

    SPC f s             # save buffer
    SPC T n             # next theme
    SPC t n             # set number
    SPC t 8             # highlight chars beyond 80th column
    SPC t h i           # toggle highlight indentation levels
    SPC t i             # toggle indentation guide at a point
    SPC t l             # toggle truncate lines
    
    SPC T f             # toggle fullscreen
    SPC T m             # toggle menu bar
    SPC T M             # toggle frame maximize
    SPC T t             # toggle tool bar
    
    SPC t m p           # toggle character position
    [ b                 # prev buf
    ] b                 # next buf
    [ f                 # prev file in dir
    ] f                 # next file in dir
      l                 # error
      h                 # vcs hunk
      w                 # window
