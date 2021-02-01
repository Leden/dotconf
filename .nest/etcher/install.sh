#!/bin/sh
set -e

source_file="/etc/apt/sources.list.d/balena-etcher.list"
[ -f "$source_file" ] || echo "deb https://deb.etcher.io stable etcher" | sudo tee "$source_file"

sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61

sudo apt-get update
sudo apt install -y balena-etcher-electron
