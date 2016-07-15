#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="
bin
tern-config
bashrc
vim
vimrc
phoenix.js
gvimrc
jshintrc
aliases
editorconfig
zshrc
tmuxinator
tmux.conf
tmux
todotxt-machinerc
git-flow-completion.zsh
"    # list of files/folders to symlink in homedir

##########

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
mkdir ~/.config
ln -s $dir/vim  ~/.config/nvim
ln -s $dir/vimrc  ~/.config/nvim/init.vim

mv ~/.nvimrc ~/dotfiles_old/
mv ~/.nvim ~/dotfiles_old/
ln -s ~/dotfiles/vimrc ~/.nvimrc
ln -s ~/dotfiles/vim ~/.nvim

#Install my custom colorscheme
git clone https://github.com/jojoyuji/gruvbox ~/.vim/bundle/gruvbox
git clone https://github.com/marijnh/tern_for_vim ~/.vim/bundle/tern_for_vim
cd ~/dotfiles/ && git clone https://github.com/robbyrussell/oh-my-zsh
cp ~/dotfiles/jojo.zsh-theme ~/dotfiles/oh-my-zsh/themes/jojo.zsh-theme

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install python
brew install ruby
brew install tmux
gem install tmuxinator
pip install neovim




chsh -s $(which zsh)

#echo "Installing jshint"
#npm install -g jshint jscs


