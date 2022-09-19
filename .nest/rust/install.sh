#!/bin/sh
set -e

VERSION="stable"

asdf plugin-list | grep rust >/dev/null || {
	asdf plugin-add rust
}

asdf install rust "$VERSION"
asdf global rust "$VERSION"
