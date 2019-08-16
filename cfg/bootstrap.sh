#!/bin/sh

set -ex

repo_url_https="https://github.com/Leden/dotconf.git"
repo_url_ssh="git@github.com:Leden/dotconf.git"

sudo apt update
sudo apt install -y curl git

rm -rf "$HOME/.cfg"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

git clone --bare "$repo_url_ssh" "$HOME/.cfg" || git clone --bare "$repo_url_https" "$HOME/.cfg"
config checkout --force
config config --local status.showUntrackedFiles no

"$HOME/cfg/install.sh"
