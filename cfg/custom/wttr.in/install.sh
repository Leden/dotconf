#!/bin/sh

set -ex

mkdir -p "$HOME/cfg/bash/include/"
[ -L "$HOME/cfg/bash/include/wttr.in" ] || ln -s "$HOME/cfg/custom/wttr.in/bashrc" "$HOME/cfg/bash/include/wttr.in"

