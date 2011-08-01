# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="superjarin"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby rails3 gem git-flow github bundler rvm npm macports vi-mode)
echo "Going to load RVM"

source $ZSH/oh-my-zsh.sh
# Fix search like ctrl-r for vim
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


# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH=${PATH}:/Developer/android-sdk-mac_x86/platform-tools/
export PATH=${PATH}:/Developer/android-sdk-mac_x86/tools
export EDITOR=vim
alias titanium_iphone1.6.2="/Library/Application\ Support/Titanium/mobilesdk/osx/1.6.2/titanium.py run --platform=iphone"
alias titanium_iphone1.7.0="/Users/joel/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.0/titanium.py run --platform=iphone"
alias titanium_iphone1.7.1="/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.1/titanium.py run --platform=iphone"
alias titanium_android="/Library/Application\ Support/Titanium/mobilesdk/osx/1.6./titanium.py run --platform=iphone"

