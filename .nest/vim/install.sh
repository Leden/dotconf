#!/bin/sh
set -e

sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt-get update

sudo apt install -y vim git curl

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
