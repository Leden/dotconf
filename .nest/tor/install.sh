#!/bin/sh
set -ex

RELEASE=$(lsb_release -cs)

echo "deb https://deb.torproject.org/torproject.org ${RELEASE} main" | sudo tee /etc/apt/sources.list.d/tor.list
echo "deb-src https://deb.torproject.org/torproject.org ${RELEASE} main" | sudo tee -a /etc/apt/sources.list.d/tor.list

curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

sudo apt update
sudo apt install -y tor deb.torproject.org-keyring nyx
