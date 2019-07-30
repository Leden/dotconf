#!/bin/sh

# Depends :: mono-complete

set -xe

VERSION="1.9.14"
FILENAME="vs_archive_${VERSION}.tar.gz"
DOWNLOAD_URL="https://cdn.vintagestory.at/gamefiles/stable/$FILENAME"
TMP_DIR=$(mktemp -d)

cd "$TMP_DIR"
wget "$DOWNLOAD_URL" -O "$TMP_DIR/$FILENAME"
tar xzvf "$TMP_DIR/$FILENAME"

# Required for installer to create a menu entry and a desktop icon
mkdir -p "$HOME/.local/share/applications/"
mkdir -p "$(xdg-user-dir DESKTOP)/"

cd "$TMP_DIR/vintagestory/"
"./install.sh"

cd "$HOME"
rm -rf "$TMP_DIR"
