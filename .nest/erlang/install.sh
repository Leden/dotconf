#!/bin/sh
set -e

ERLANG_VERSION=22.2.7

asdf plugin-add erlang || echo 'ok...'
asdf install erlang $ERLANG_VERSION || echo 'ok...'
asdf global erlang $ERLANG_VERSION || echo 'ok...'
