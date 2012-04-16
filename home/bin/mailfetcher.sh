#!/bin/sh

if [ "$1" = "-v" ]; then
    EXTRAARG="-v"
fi

/opt/local/bin/fetchmail $EXTRAARG >/dev/null 2>&1

#if [ "$?" = "0" ]; then
#    echo "New mail received" | ruby -rubygems ~/bin/gnotify.rb
#fi
