# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh
MAILTO=

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
plugins=(git)

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
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH
alias d="cd ~/Desktop/"

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


function syncvoo(){
rsync -avz -e ssh /Applications/MAMP/htdocs/wordpress/ root@198.199.91.77:/var/www/wordpress
}
function keyDeploy(){
rsync -avz -e ssh *  root@192.241.134.114:/var/www/dev.7blazes.com/juntoscms/
}

function sync(){
rsync -avz -e ssh $1  root@192.241.134.114:/var/www/$2
}

function slack(){
curl --data $1 $'https://onetalk.slack.com/services/hooks/slackbot?token=6149yi9dfDmDSWyeEZ6iJjl4&channel=%23'$2
}

function syncvoando(){
rsync -avz -e ssh /Applications/MAMP/htdocs/voandonasasas/ root@198.199.91.77:/var/www/voandonasasas
}

# Show hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

alias hugme="cd ~/devtools/obvio/hugme/"
alias one="cd ~/Desktop/OneTalk/onetalk-node/"
#alias juntos="cd ~/Desktop/Juntos/site/frontend/"
alias 7blazes="cd ~/Desktop/7blazes/7blazes-components/"



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
