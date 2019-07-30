#!/bin/sh

set -ex

sudo apt update
sudo apt install git

git clone --bare git@github.com:Leden/dotconf.git "$HOME/.cfg"

"$HOME/cfg/install.sh"
