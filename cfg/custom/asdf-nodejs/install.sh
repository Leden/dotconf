#!/bin/sh

set -ex

( asdf plugin-list | grep -q '^nodejs$' ) || asdf plugin-add nodejs

~/.asdf/plugins/nodejs/bin/import-release-team-keyring

VERSION=$(asdf list-all nodejs | tail -n1)
[ -z $VERSION ] && exit 1

asdf install nodejs $VERSION
asdf global nodejs $VERSION

