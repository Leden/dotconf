#!/bin/sh

set -xe

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.3

mkdir -p $HOME/cfg/bash/include/
ln -s $HOME/cfg/custom/asdf/bashrc $HOME/cfg/bash/include/asdf

