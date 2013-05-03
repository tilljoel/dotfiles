#!/bin/sh

DOTFILES_DIR=`dirname $(readlink -f $0)`
cd $DOTFILES_DIR

for file in `git ls-files`; do
    file=`readlink -f $file`
    xargs ln -sft $HOME $file
done

