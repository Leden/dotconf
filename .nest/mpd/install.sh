#!/bin/sh
set -e

sudo apt install -y mpd
systemctl --user enable mpd
systemctl --user start mpd

