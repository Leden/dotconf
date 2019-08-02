#!/bin/sh

set -ex

ensure_line_in_file () {
	[ -f "$2" ] || touch "$2"
	grep -q "^$1$" "$2" || echo "$1" >>"$2"
}

ensure_line_in_file '. $HOME/cfg/bash/bashrc #:cfg:bash:bashrc' "$HOME/.bashrc"
ensure_line_in_file 'source $HOME/cfg/vim/vimrc ":cfg:vim:vimrc' "$HOME/.vimrc"

for setup_repo in "$HOME"/cfg/custom/*/repo.sh
do
	$setup_repo
done

crontab "$HOME/cfg/crontab"
