#!/bin/sh
#DOTFILES_DIR=`dirname $(greadlink -f $0)`
cd /Users/joel/.dotfiles
echo `pwd`
for file in `git ls-files`; do
    file=`greadlink -f $file`
    echo "link $file"
    ln -sf $file $HOME
done

shopt -s dotglob
cd /Users/joel/.dotfiles_secret
echo `pwd`
for file in * 
do
    if test -f "$file" 
    then
       echo "link $file"
       ln -sf $file $HOME
    fi
done
shopt -u dotglob
