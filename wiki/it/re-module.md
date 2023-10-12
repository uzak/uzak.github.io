# Python re module

Test some regex:

    import re
    re.match("\\d+", "123d")
    
    re.search('test', 'TeSt', re.IGNORECASE)        # case insensitive
    
    \\S                                             # whitespace
