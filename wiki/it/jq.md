# JQ

https://shapeshed.com/jq-json/

    cat bookmarks-2020-03-04.json| jq '.children[1].children[0].children[11].children'  | jq 'map(.uri)' > music.txt
    
https://blog.appoptics.com/jq-json/

    for a in iX/*json; do echo $a: `cat $a | jq .x,.z,.M63 | tr  '\n' ' '`; done
