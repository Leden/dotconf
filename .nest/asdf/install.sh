#!/bin/sh

set -xe

[ -d "$HOME/.asdf" ] || git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.7.3

sudo apt install -y automake autoconf libreadline-dev \
  libncurses-dev libssl-dev libyaml-dev \
  libxslt-dev libffi-dev libtool unixodbc-dev \
  unzip curl

