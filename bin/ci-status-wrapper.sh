path=$(git rev-parse --show-cdup)
cache_file="./$path.ci-status"
git_dir="./$path.git"

if [ -e $cache_file ]; then
  if [ $cache_file -ot $git_dir ]; then
    ci-status --reporter=simple | cut -f 5 -d' ' > $cache_file
  fi
else
  ci-status --reporter=simple | cut -f 5 -d' ' > $cache_file
fi
cat $cache_file
