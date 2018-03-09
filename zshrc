export EDITOR='nvim'
# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

source ~/.zplug/init.zsh

zplug "bobthecow/git-flow-completion"
zplug "Valiev/almostontop"
zplug "djui/alias-tips"
zplug "arzzen/calc.plugin.zsh"
zplug "walesmd/caniuse.plugin.zsh"
zplug "akoenig/npm-run.plugin.zsh"

zplug load

for file in $HOME/dotfiles/{extra,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done


# Customize to your needs...

alias d="cd ~/Desktop/"
alias 7b="cd ~/Desktop/7blazes/git/"
alias b="cd ~/Desktop/binds/"
alias zshrc="vim ~/dotfiles/zshrc"
alias cls="clear"

# Show hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

alias undocommit="git reset --soft HEAD~1"

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

alias im='nvim'
alias pushAll='g push && gcm && g push'

function upvim(){
  brew update
  brew reinstall --HEAD neovim
}

function upalacritty(){
  cd ~/alacritty
  git pull origin HEAD
  rustup update stable
  cargo build --release
  make app
  cp -r target/release/osx/Alacritty.app /Applications/Alacritty.app
  cd -
}
function upprezto(){
  cd $ZPREZTODIR
  git pull
  git submodule update --init --recursive
}
alias irc= 'weechat';

### Added by the Heroku Toolbelt

export PATH=$HOME/local/bin:$PATH
export PATH=usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/.local/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

if [ "$TERM" = "screen" ] && [ "$HAS_256_COLORS" = "yes" ]
then
  export TERM=screen-256color
fi
  export TERM=screen-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"


if [[ -a ~/.secrets ]]; then
  source ~/.secrets
fi

export FZF_DEFAULT_COMMAND='ag -g ""'

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
