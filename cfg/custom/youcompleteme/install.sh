#!/bin/sh

set -ex

cd "$HOME/.vim/bundle/YouCompleteMe"

python install.py --ts-completer

