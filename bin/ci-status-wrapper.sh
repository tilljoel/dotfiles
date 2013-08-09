path=$(git rev-parse --show-cdup)
cache_file="./$path.ci-status"
git_dir="./$path.git"

echo $path
echo $cache_file
echo $git_dir
if [ -e $cache_file ]; then
  if [ $cache_file -nt $git_dir ]; then
    echo 'cache'
    cat $cache_file
  else
    echo 'update cache'
    ci-status --reporter=simple > $cache_file
  fi
else
  echo 'first live'
  ci-status --reporter=simple > $cache_file
fi
