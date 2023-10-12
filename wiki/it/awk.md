SRC [YT AWK: hack the planet](https://www.youtube.com/watch?v=43BNFcOdBlY)
SRC [Awk Tutorial](https://blog.jpalardy.com/posts/awk-tutorial-part-1/)

# Structure

    pattern { action }
    
* Either pattern or action can be omitted. Defaults used then for action: `{ print $1 }` and for pattern: `/regex/`.

# Patterns
    
    BEGIN
    END
    pattern1, pattern2      # awk range pattern
    expression
    regexp 
    compound pattern && (AND), || (OR), ! (NOT)

# Operators

    <, <=, ==, !=, >=, >
    /regexp/          # (entire line match - "$0 ~")
    expr ~  /regexp/  # matched by regexpr  
    expr !~ /regexp/  # not matched by regexpr
    ++, --
    
# Functions
* Math (lib)
* String (lib)
* You can define your own.

# Variables
    
    NF  # number of fields
    NR  # number of records
    ARGC
    ARGV
    FILENAMe    # current input file
    FNR         # record number in current file
    FS          # input field separator, default " "
    OFS         # output FS, default " "
    ORS         # output record separator, default "\n"
    OFMT        # output format for numbers, default "%.6g"
    RLENGTH     # length of the string by match fct
    RS          # input record separator, default "\n"
    RSTART      # start of string matched by match fct
    SUBSEP      # subscript seprator

# Actions

* Parenthesis in function calls are optional.
* Default argument is always $0.

    print
    printf(fmt, expression-list)
    if (expr) statement
    if (expr)  stmt else stmt
    while (expr) stmt
    for (expr; expr; expr) stmt
    for (var in array) stmt
    break
    continue
    next
    exit expr

# Types
* Strings
  * automatic concat: "hello" "world" -> "helloworld"
* Numbers
* types will be automatically coerced when needed.

# Arrays
* one dimensional
* for string or numbers
* all arrays are associative

# Examples

* Curly brackets indicate awk it is an action not a pattern:

```
awk '{ print $2 }'
awk '$3 == 10'
```

Misc:
    
    awk -F, '{ print $1 }'
    
    BEGIN { print "Hello World!" }
    
    awk 'BEGIN { FS=":" } NR>=2 && NR<=4 { print $1 } ' /etc/passwd

    awk '{ print NR, $0 }'      # add line numbers to input
    
    awk '{ print $1 "makes" $3 "per hour" }' | uniq -f2     # unique wages
    
    awk '{ printf("%s makes $%.2 per hour\n", $1, $3) }'
    
    awk '{ gsub(/USA/, "United States"); print }'
    
    {
        w += NF
        c += length + 1
    }
    END { print NR, w, c}
    
    awk '{ FS=":"; print $(NF-1) }'     # second to last field

    awk '{$1=$1}1' file.txt  # MAGIC: remove leading whitespace (2 actions)
    
    # multiple blocks (expr+action) are possible
    cat netflix.tsv | awk '/^2016-03-24/ {print} $4 == 96.43 {print}'
    # next skips to next line in case both block would match.
    cat netflix.tsv | awk '/^2016-03-24/ {print; next} $4 == 97.07 {print}'
    
    # arrays
    cat netflix.csv | awk -F'[,-]' '{volume[$1] += $8} END { for(year in volume) print year, volume[year]}'
