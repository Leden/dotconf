#!/bin/sh

set -ex

PY2_VERSION="2.7.16"
PY3_VERSION="3.7.4"

export PYTHON_CONFIGURE_OPTS="--enable-shared"

( asdf plugin-list | grep -q 'python' ) || asdf plugin-add python

asdf install python $PY2_VERSION
asdf install python $PY3_VERSION

asdf global python $PY3_VERSION
