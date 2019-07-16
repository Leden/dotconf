#!/bin/sh

set -e

TAG='#:cfg:bash:bashrc'
SNIPPET=". $HOME/cfg/bash/bashrc ${TAG}"
LINES=$(grep -e "$TAG$" $HOME/.bashrc | wc -l )

[ 0 -eq "$LINES" ] && echo "${SNIPPET}" >>$HOME/.bashrc

