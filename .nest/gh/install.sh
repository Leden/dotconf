#!/bin/sh
set -e

VERSION="1.1.0"
OS="linux"
ARCH="amd64"
DEB_FILE="gh_${VERSION}_${OS}_${ARCH}.deb"
URL="https://github.com/cli/cli/releases/download/v${VERSION}/${DEB_FILE}"


wget "$URL" -O /tmp/"$DEB_FILE"

sudo apt install -y /tmp/"$DEB_FILE"

rm /tmp/"$DEB_FILE"
