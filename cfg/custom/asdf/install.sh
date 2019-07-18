#!/bin/sh

set -xe

[ -d $HOME/.asdf ] || git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.7.3

mkdir -p $HOME/cfg/bash/include/
[ -L $HOME/cfg/bash/include/asdf ] || ln -s $HOME/cfg/custom/asdf/bashrc $HOME/cfg/bash/include/asdf

sudo apt install automake autoconf libreadline-dev \
  libncurses-dev libssl-dev libyaml-dev \
  libxslt-dev libffi-dev libtool unixodbc-dev \
  unzip curl

