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

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


plugins=(git git-flow-completion)
source $ZSH/oh-my-zsh.sh
source ~/.zplug/zplug

zplug "bobthecow/git-flow-completion"
zplug "Valiev/almostontop"
zplug "djui/alias-tips"
zplug "arzzen/calc.plugin.zsh"
#zplug "walesmd/caniuse.plugin.zsh"
#zplug "akoenig/npm-run.plugin.zsh"

zplug load --verbose
 #eval "$(gulp --completion=zsh)"

for file in ~/dotfiles/{extra,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done


# Customize to your needs...
export PATH=$HOME/local/bin:$PATH
export PATH=usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/Cellar/ruby/2.0.0-p247/bin:$PATH"
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH

alias d="cd ~/Desktop/"
alias 7b="cd ~/Desktop/7blazes/git/"
alias b="cd ~/Desktop/binds/"
alias zshrc="vim ~/dotfiles/zshrc"
alias cls="clear"

function new()
{
  cp -R ~/Boilerplate/PROJECT `pwd`;
  mv PROJECT $1;
}

# Show hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

alias undocommit="git reset --soft HEAD~1"

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
alias mux='TERM=xterm-256color /usr/local/bin/mux'
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


if [[ -a ~/.secrets ]]; then
  source ~/.secrets
fi

export FZF_DEFAULT_COMMAND='ag -g ""'


# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/jojo/Downloads/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/jojo/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/jojo/Downloads/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/jojo/Downloads/google-cloud-sdk/completion.zsh.inc'
fi
