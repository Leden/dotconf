#!/bin/sh
set -e
    

package="discord"
flags=""
( snap info "$package" | grep -q "^  stable:.*classic$" ) && flags="--classic"
args="$flags $package"
sudo snap install $args