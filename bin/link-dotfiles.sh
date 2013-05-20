#!/bin/sh
cd /Users/joel/.dotfiles

echo `pwd`
for file in `git ls-tree --name-only HEAD ./`; do
  FILE=`greadlink -f $file`

  case "$FILE" in
    *dotfiles/bin*) ln -sf $FILE $HOME/bin ;;
    *)              ln -sf $FILE $HOME ;;
  esac
    echo "ln -sf $file $HOME"
    #ln -sf $file $HOME
done

shopt -s dotglob

cd /Users/joel/.dotfiles_secret
echo `pwd`
for file in *
do
  if test -f "$file"
  then
    FILE=`greadlink -f $file`
    echo "ln -sf $FILE $HOME"
    ln -sf $FILE $HOME
  fi
done

shopt -u dotglob
