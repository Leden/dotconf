#!/bin/sh
set -e

version=2.3.8
filename="openbazaar2_${version}_amd64.deb"

[ -f "/tmp/${filename}" ] || wget "https://github.com/OpenBazaar/openbazaar-desktop/releases/download/v${version}/${filename}" -O "/tmp/${filename}"

sudo dpkg -i "/tmp/${filename}"
