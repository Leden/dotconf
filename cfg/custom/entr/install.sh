#!/bin/sh

set -ex

sudo apt install -y entr

sudo sed -i 's/#DefaultLimitNOFILE=/DefaultLimitNOFILE=65535/' /etc/systemd/system.conf
