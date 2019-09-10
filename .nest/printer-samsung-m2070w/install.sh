#!/bin/sh

set -ex

cd /tmp || exit
wget https://www.bchemnet.com/suldr/driver/UnifiedLinuxDriver-1.00.37.tar.gz
tar xzvf UnifiedLinuxDriver-1.00.37.tar.gz
cd uld || exit
sudo ./install.sh

cd /usr/lib/x86_64-linux-gnu/sane || exit
sudo ln -fs /opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1 /usr/lib/x86_64-linux-gnu/sane/libsane-smfp.so.1

sudo apt install -y libusb-0.1-4
