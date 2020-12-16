#!/bin/sh
set -e

TAG="$(curl 'https://api.github.com/repos/cli/cli/releases/latest' | jq -r '.tag_name')"
VERSION="${TAG##v}"
OS="linux"
ARCH="amd64"
DEB_FILE="gh_${VERSION}_${OS}_${ARCH}.deb"
URL="https://github.com/cli/cli/releases/download/${TAG}/${DEB_FILE}"


wget "$URL" -O /tmp/"$DEB_FILE"

sudo apt install -y /tmp/"$DEB_FILE"

rm /tmp/"$DEB_FILE"
