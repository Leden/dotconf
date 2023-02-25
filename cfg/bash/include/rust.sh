_dir="$HOME/.asdf/installs/rust/stable/bin"

[ -d "$_dir" ] && {
	PATH="$PATH:$_dir"
}

command -v sccache >/dev/null &&  {
	export RUSTC_WRAPPER=sccache
}
