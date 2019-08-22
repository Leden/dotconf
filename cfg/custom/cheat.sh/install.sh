#!/bin/sh

set -ex

sudo apt install rlwrap

mkdir -p ~/bin/
curl https://cht.sh/:cht.sh > ~/bin/cht.sh
chmod +x ~/bin/cht.sh

curl cheat.sh/:bash_completion >"$(dirname "$0")/bash_completion"
ln -fs "$HOME/cfg/custom/cheat.sh/bash_completion" "$HOME/cfg/bash/include/cht.sh"
