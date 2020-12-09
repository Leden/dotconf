#!/bin/sh
set -e

sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt-get update

sudo apt install -y vim
