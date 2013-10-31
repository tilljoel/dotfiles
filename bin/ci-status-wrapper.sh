path=$(git rev-parse --show-cdup)
cache_file="./$path.bs"
git_dir="./$path.git"

if [ -e $cache_file ]; then
  if [ $cache_file -ot $git_dir ]; then
    (RBENV_VERSION=1.9.3 ci-status --reporter=minimal > $cache_file &)
  fi
else
  (RBENV_VERSION=1.9.3 ci-status --reporter=minimal > $cache_file &)
fi
cat $cache_file
