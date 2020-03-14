#]!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
files="
tern-config
bashrc
vim
vimrc
zpreztorc
gvimrc
jshintrc
eslintrc
aliases
editorconfig
zshrc
tmuxinator
tmux.conf
tmux
"    # list of files/folders to symlink in homedir

##########

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf $dir/$file ~/.$file
done
ln -s $dir/vim  ~/.config/nvim
ln -s $dir/vimrc  ~/.config/nvim/init.vim

ln -s ~/dotfiles/vimrc ~/.nvimrc
ln -st ~/dotfiles/vim ~/.nvim

#Install my custom colorscheme
git clone https://github.com/jojoyuji/gruvbox ~/.vim/bundle/gruvbox

git clone https://github.com/marijnh/tern_for_vim ~/.vim/bundle/tern_for_vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jojoyuji/phoenix ~/.config/phoenix




