#!/bin/sh
set -e

# GUI
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
ln -f -s ~/.joplin/Joplin.AppImage ~/bin/gjoplin

# CLI
NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
ln -f -s ~/.joplin-bin/bin/joplin ~/bin/joplin
