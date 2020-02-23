#!/bin/sh
set -e

# GUI
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash

# CLI
NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
ln -s ~/.joplin-bin/bin/joplin ~/bin/joplin
