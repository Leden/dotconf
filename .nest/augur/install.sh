#!/bin/sh
set -ex

curl -s https://repo.augur.net/repo_augur_net.key | sudo apt-key add -

echo "deb https://repo.augur.net/ augur stable" | sudo tee /etc/apt/sources.list.d/augur.list

sudo apt update

sudo apt install -y augur
