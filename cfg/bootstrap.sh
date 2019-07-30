#!/bin/sh

set -ex

sudo apt update
sudo apt install -y git

git clone --bare "https://github.com/Leden/dotconf.git" "$HOME/.cfg"

"$HOME/cfg/install.sh"
