#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="tern-config bashrc vim vimrc phoenix.js gvimrc jshintrc aliases editorconfig zshrc tmuxinator tmux.conf tmux"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"

mkdir -p $olddir
echo "...done"

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

mv ~/.nvimrc ~/dotfiles_old/
mv ~/.nvim ~/dotfiles_old/
ln -s ~/dotfiles/vimrc ~/.nvimrc
ln -s ~/dotfiles/vim ~/.nvim

#echo "cloning vundle & colorthemes"
##Install Vundle for vim plugins
#git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#Install my custom colorscheme
git clone https://github.com/jojoyuji/gruvbox ~/.vim/bundle/gruvbox
#Install YCM
#git clone https://github.com/Valloric/YouCompleteMe ~/.vim/bundle/YouCompleteMe
#cd ~/dotfiles/vim/bundle/YouCompleteMe/ && ./install

git clone https://github.com/marijnh/tern_for_vim ~/.vim/bundle/tern_for_vim
git clone https://github.com/marijnh/tern_for_vim ~/.vim/bundle/tern_for_vim

cd ~/.vim/bundle/tern_for_vim && npm install

cd ~/dotfiles/ && git clone https://github.com:robbyrussell/oh-my-zsh.git
cp ~/dotfiles/jojo.zsh-theme ~/dotfiles/oh-my-zsh/themes/jojo.zsh-theme

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


#chsh -s $(which zsh)

#echo "Installing jshint"
#npm install -g jshint jscs


