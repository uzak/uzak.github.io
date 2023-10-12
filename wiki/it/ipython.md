# IPython

https://ipython.readthedocs.io/en/stable/index.html

    ?
    %quickref
    object?
    object??
    
    %history
    %timeit [math.sin(x) for x in range(500)]
    <TAB>                       # autocompletion
    files  = !ls                # store output of a command in a variable
    
    %who                        # show vars in scope
    %whos                       # detto, detailed.
    
    %pdef os.path.join
    %pdos os.path.join
    
    _                           # previous output (just like default python)
    _i                          # previous input
    
    %doctest_mode
    
    *l?                         # show all variables ending with `l` 
