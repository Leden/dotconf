#!/bin/sh

set -ex

PY3_VERSION="3.8.7"

export PYTHON_CONFIGURE_OPTS="--enable-shared"

( asdf plugin-list | grep -q 'python' ) || asdf plugin-add python

sudo apt install -y zlib1g-dev libsqlite3-dev libbz2-dev
asdf install python $PY3_VERSION

asdf global python $PY3_VERSION
