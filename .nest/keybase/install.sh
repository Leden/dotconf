#!/bin/sh

set -x

wget -ct0 https://prerelease.keybase.io/keybase_amd64.deb
# if you see an error about missing `libappindicator1` from the next
# command, you can ignore it, as the subsequent command corrects it
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -fy
run_keybase

