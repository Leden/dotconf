#!/bin/sh

set -ex

fontsdir="$HOME/.local/share/fonts"
fontconfigdir="$HOME/.fonts.conf.d"

pip install --user powerline-status

mkdir -p "$fontsdir"
cd "$fontsdir"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf

sudo fc-cache -vf "$fontsdir"

mkdir -p "$fontconfigdir"
cd "$fontconfigdir"
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
