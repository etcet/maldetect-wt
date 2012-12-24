#/bin/bash

inspath=./files
currenthash=maldet-wt.current.hash
md5sum $inspath/maldet $inspath/internals.conf $inspath/inotify/tlog $inspath/inotify/inotifywait $inspath/clean/* | awk '{print$1}' | tr '\n' ' ' | tr -d ' ' > $currenthash
echo `cat $currenthash`

scp -P 2222 $currenthash chris@etcet.net:/home/chris/public_html/maldetect/

