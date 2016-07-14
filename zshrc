# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

#bind -r '\C-s'
#stty -ixon

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jojo"
export EDITOR='vim'
#source ~/dotfiles/tmux/completion/tmuxinator.zsh

# Example aliases
# alias zshconfig="mate ~/.zshrc"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

plugins=(git git-flow-completion)

source $ZSH/oh-my-zsh.sh
for file in ~/dotfiles/{extra,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done


# Customize to your needs...
export PATH=$HOME/local/bin:$PATH
export PATH=usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/Cellar/ruby/2.0.0-p247/bin:$PATH"
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=/Library/Python/2.7/site-packages:$PYTHONPATH

#export PYTHONPATH=/usr/local/lib/python3.5/site-packages:$PYTHONPATH
#export PYTHONPATH=/Library/Python/3.5/site-packages:$PYTHONPATH


export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH
alias d="cd ~/Desktop/"
alias 7b="cd ~/Desktop/7blazes/git/"

alias zshrc="vim ~/dotfiles/zshrc"
alias cls="clear"
alias pathogen="cd ~/dotfiles/vim/bundle/"
alias typefoo="cd ~/Work/TypeFoo/projects"
alias frontend="cd ~/Developer/FrontEnd"
alias dev="cd ~/Developer/"

function new()
{
  cp -R ~/Boilerplate/PROJECT `pwd`;
  mv PROJECT $1;
}

function jboss(){
cd ~/dev/tools/jboss-as-7.1.1.Final/bin/
./standalone.sh

}
function myserver(){
#ssh root@198.199.91.77
ssh root@192.241.134.114 -p 7777
}

function jserver(){
ssh root@104.131.15.81
}
function aserver(){
ssh root@45.55.148.53 -p 7777
}

function lserver(){
ssh deploy@45.55.148.53 -p 7777
}


function syncvoo(){
rsync -avz -e ssh /Applications/MAMP/htdocs/wordpress/ root@198.199.91.77:/var/www/wordpress
}
function keyDeploy(){
rsync -avz -e ssh *  root@192.241.134.114:/var/www/dev.7blazes.com/juntoscms/
}

function sync(){
rsync -avz -e ssh $1  root@192.241.134.114:/var/www/$2
}

function syncvoando(){
rsync -avz -e ssh /Applications/MAMP/htdocs/voandonasasas/ root@198.199.91.77:/var/www/voandonasasas
}

# Show hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

alias hugme="cd ~/devtools/obvio/hugme/"
alias one="cd ~/Desktop/OneTalk/onetalk-node/"
alias 7blazes="cd ~/Desktop/7blazes/7blazes-components/"

alias undocommit=" git reset --soft HEAD~1"

#alias vim="/usr/local/Cellar/macvim/HEAD/MacVim.app/Contents/MacOS/Vim"

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

alias todo='python ~/t/t.py --task-dir ~/tasks --list tasks'
alias todotxt='todo.sh'
alias t='todotxt-machine'
alias edit='vim `git ls-files -m` -p'
alias im='nvim'
alias vim='nvim'

function updatenvim(){
brew update
brew reinstall --HEAD neovim
}


### Added by the Heroku Toolbelt

export PATH="/usr/local/heroku/bin:$PATH"
alias mux='TERM=xterm-256color tmuxinator'
export COLORTERM=xterm-256color
export XTERM=xterm-256color
export TERM=xterm-256color
#export COLORTERM=xterm-256color

if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
  export TERM=xterm-256color
  export HAS_256_COLORS=yes
fi
if [ "$TERM" = "screen" ] && [ "$HAS_256_COLORS" = "yes" ]
then
  export TERM=screen-256color
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"
#export DEV_DATABASE_URL='mongodb://ocean:eGIzFjALjTapNN90zphrJicOMmMGe3ApYh0h9y3K1SCXQrLEyxA0eJcMtHQbUblT@capital.3.mongolayer.com:10154,capital.2.mongolayer.com:10154/dev?replicaSet=set-552832103792c5dc78001c3e&readPreference=secondaryPreferred'
#export APP_DATABASE_URL='mongodb://ocean:YK6Rjl49iBhHpbhAeDKxprEbxedi88UFgtpUs5ryFfbGaInM2tVeYTlubXNXoySe@capital.3.mongolayer.com:10154,capital.2.mongolayer.com:10154/app?replicaSet=set-552832103792c5dc78001c3e&readPreference=secondaryPreferred'

APP_DATABASE_URL='mongodb://bumblebee:hey22rupra4ebrUtHut4Aduzesp5dra2CUmeDrExEDAb77TrawRe3ru5ekayacra@gcp-us-east1-cpu.1.dblayer.com:10016,gcp-us-east1-cpu.0.dblayer.com:10025/app?ssl=true&sslValidate=false&readPreference=secondaryPreferred'

source ~/.git-flow-completion.zsh
