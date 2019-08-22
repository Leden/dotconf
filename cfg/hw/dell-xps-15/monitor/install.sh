#!/bin/sh

set -e

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

mkdir -p "$HOME/.config/autostart/"
sudo ln -sf "$dir/monitor-hotplug.sh" "/usr/local/bin/monitor-hotplug.sh"
sudo ln -sf "$dir/98-monitor-hotplug.rules" "/etc/udev/rules.d/98-monitor-hotplug.rules"
ln -sf "$dir/monitor-hotplug.sh.desktop" "$HOME/.config/autostart/monitor-hotplug.sh.desktop"
sudo udevadm control --reload-rules
sudo udevadm trigger
