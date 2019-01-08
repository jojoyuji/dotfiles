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

for file in $HOME/dotfiles/{exports,aliases}; do
  [ -r "$file" ] && source "$file"
done

# source functions
for file in $HOME/dotfiles/helpers/*.sh; do
  [ -r "$file" ] && source "$file"
done


# Customize to your needs...

alias d="cd ~/Desktop/"
alias 7b="cd ~/7blazes/git/"
alias b="cd ~/Desktop/binds/git/"
alias zshrc="vim ~/dotfiles/zshrc"
alias cls="clear"
alias dotfiles="cd $HOME/dotfiles"

# Show hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"


defaults write -g InitialKeyRepeat -int 10
alias im='nvim'
alias pushAll='g push && gcm && g push'


# brew update
# brew reinstall --HEAD neovim
function upvim(){
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
  tar xzf nvim-macos.tar.gz
  ./nvim-osx64/bin/nvim
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

export PATH=$HOME:$PATH
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jojo/Documents/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jojo/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jojo/Documents/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jojo/Documents/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh