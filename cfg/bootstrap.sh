#!/bin/sh

set -ex

sudo apt update
sudo apt install -y curl git

rm -rf "$HOME/.cfg"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

git clone --bare "https://github.com/Leden/dotconf.git" "$HOME/.cfg"
config checkout --force
config config --local status.showUntrackedFiles no

"$HOME/cfg/install.sh"
