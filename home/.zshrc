# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="robbyrussell"
ZSH_THEME="superjarin"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby rails3 gem git-flow github bundler rvm npm macports vi-mode)

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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH=${PATH}:/Developer/android-sdk-mac_x86/platform-tools/
export PATH=${PATH}:/Developer/android-sdk-mac_x86/tools
export PATH=/opt/local/bin:${PATH}
export PATH=~/bin:${PATH}
export EDITOR=vim
alias titanium_iphone1.7.2="/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.2/titanium.py run --platform=iphone"
alias titanium_android1.7.2="/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.2/titanium.py run --platform=android --android=/Users/joel/android-sdk-mac_x86"

export SSL_CERT_FILE=/path/to/your/new/cacert.pem

