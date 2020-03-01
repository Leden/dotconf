#!/bin/sh
set -e

wget https://github.com/shirou/mqttcli/releases/download/0.0.3/mqttcli_linux_amd64 -O "$HOME/bin/mqttcli"
chmod +x "$HOME/bin/mqttcli"
