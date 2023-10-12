# FZF - fuzzy finder

* [project page @ github](https://github.com/junegunn/fzf)
* [vim universe. fzf @ youtube](https://www.youtube.com/watch?v=qgG5Jhi_Els)
* ['missing demo' by samoskhin](https://www.freecodecamp.org/news/fzf-a-command-line-fuzzy-finder-missing-demo-a7de312403ff/)
* [fzf @ archlinux](https://wiki.archlinux.org/index.php/Fzf)

Advantages:

* interactive search 
* instant feedback.
  
    fzf -m                  # select multiple items with TAB
    fzf -e                  # exact matching
    
or `'string` in interactive search
    
    
fzf: `^a var .sh$ !private` 

    
    fzf | xargs ls -l       # piping from fzf
    
    vim -o $(fzf)
    
    vim ~/repos/**<TAB>     [#](#) opens fzf for file selection
    cd /**<TAB>
    ssh **<TAB>
    
    kill <TAB>              # opens fzf for kill command
    
    <alt-c>                 # triggers fzf in change dir mode
