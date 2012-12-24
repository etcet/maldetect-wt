#/bin/bash

version=1.4.1-wt-0
inspath=./files
currenthash=maldet-wt.current.hash
currentversion=maldet-wt.current.ver
currenttarball=maldetect-wt-current.tar.gz

md5sum $inspath/maldet $inspath/internals.conf $inspath/inotify/tlog $inspath/inotify/inotifywait $inspath/clean/* | awk '{print$1}' | tr '\n' ' ' | tr -d ' ' > $currenthash

cp $currenthash files/VERSION.hash

echo $version > $currentversion

currentdirname=maldetect-$version
tar cf temp.tar -X tar_excludes .
mkdir $currentdirname
tar xf temp.tar -C $currentdirname
rm temp.tar
tar czf $currenttarball $currentdirname
rm -rf $currentdirname

echo Version: `cat $currentversion`
echo Hash: `cat $currenthash`

scp -P 2222 $currenthash $currentversion $currenttarball chris@etcet.net:/home/chris/public_html/maldetect/

rm $currenthash $currentversion $currenttarball
