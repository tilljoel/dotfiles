# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="robbyrussell"
#ZSH_THEME="superjarin"
ZSH_THEME="tilljoel"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby rails3 gem git github bundler npm macports vi-mode brew heroku osx rake)

source $ZSH/oh-my-zsh.sh
# Fix search like ctrl-r for vim
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000

bindkey -v
bindkey -M vicmd '/' history-incremental-search-backward

function dev {
        if [ -f .screenrc_extra ]
                then
                #Add git branch?
                APP=$(expr $PWD : '.*/\(.*\)')
                echo $APP
                if screen -list | grep $APP;then screen -x -r $APP;else screen -S $APP -c .screenrc_extra;fi
        else
                echo "no session found"
        fi
}

# Add this to your .oh-my-zsh theme if you're using those, or directly to your zsh theme :)
#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
#git_custom_status() {
  #local cb=$(current_branch)
  #if [ -n "$cb" ]; then
    #echo "joel $(parse_git_dirty) $(git_time_since_commit)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  #fi
#}

color_ruby_words="--color-words='(:|@|@@|\$)?[a-zA-Z_][a-zA-Z0-9_]*[?!]?'"

# Colors vary depending on time lapsed.
#
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[cyan]%}"
DISABLE_AUTO_TITLE=true
DISABLE_AUTO_UPDATE="true"

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            # Get the last commit.
            last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))

            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit/3600))

            # Sub-hours and sub-minutes
            DAYS=$((seconds_since_last_commit / 86400))
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))

            if [[ -n $(git status -s 2> /dev/null) ]]; then
                if [ "$MINUTES" -gt 30 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
                elif [ "$MINUTES" -gt 10 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
                else
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
                fi
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            fi

            #if [ "$HOURS" -gt 24 ]; then
                #echo "-$COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%}"
            #elif [ "$MINUTES" -gt 60 ]; then
                #echo "-$COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%}"
            #else
                #echo "-$COLOR${MINUTES}m%{$reset_color%}"
            #fi
            if [ "$HOURS" -gt 24 ]; then
                echo ""
            elif [ "$MINUTES" -gt 60 ]; then
                echo "-$COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%}"
            else
                echo "-$COLOR${MINUTES}m%{$reset_color%}"
            fi
        fi
    fi
}

# Just add $(git_time_since_commit) to your ZSH PROMPT and you're set

# Customize to your needs...
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH=${PATH}:/Developer/android-sdk-mac_x86/platform-tools/
export PATH=${PATH}:/Developer/android-sdk-mac_x86/tools
export PATH=/opt/local/bin:${PATH}
export PATH=~/bin:${PATH}
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:${PATH}
export EDITOR=vim

alias rvim="vim app/**/*.rb spec/**/*.rb test/**/*.rb"
alias git='nocorrect git'

alias rake='noglob rake'
alias titanium_iphone1.7.2="/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.2/titanium.py run --platform=iphone"
alias titanium_android1.7.2="/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.2/titanium.py run --platform=android --android=/Users/joel/android-sdk-mac_x86"

alias titanium='~/Library/Application\ Support/Titanium/mobilesdk/osx/2.1.1.GA/titanium.py'

export SSL_CERT_FILE=/Users/joel/.ssh/cacert.pem

alias rc="bundle exec pry -r ./config/environment"


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
