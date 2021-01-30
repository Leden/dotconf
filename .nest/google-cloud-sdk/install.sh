#!/bin/sh

set -ex

line="deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main"
sources_file="/etc/apt/sources.list.d/google-cloud-sdk.list"

[ -f "$sources_file" ] || echo "$line" | sudo tee -a "$sources_file"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

sudo apt-get update
sudo apt-get install -y google-cloud-sdk
