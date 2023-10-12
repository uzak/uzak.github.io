use **fd**

newer:   

    find . -name '*.c' -newer Makefile -print
    
not changed in the last week:

    find . -name '*.java' -mtime +7 -print
    
