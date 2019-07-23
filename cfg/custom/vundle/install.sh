#!/bin/sh

set -ex

vundle_dir="$HOME/.vim/bundle/Vundle.vim"
[ -d $vundle_dir ] || git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir

mkdir -p $HOME/cfg/vim/include/
[ -L $HOME/cfg/vim/include/vundle ] || ln -s $HOME/cfg/custom/vundle/vimrc $HOME/cfg/vim/include/vundle

