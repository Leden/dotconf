#!/bin/sh

set -ex

sudo apt install rlwrap

mkdir -p ~/bin/
curl https://cht.sh/:cht.sh > ~/bin/cht.sh
chmod +x ~/bin/cht.sh

dir="$HOME/.bashrc.d/completions.d"
mkdir -p "$dir"

completion_file="$dir/cht.sh"
curl cheat.sh/:bash_completion >"$completion_file"
