#!/bin/sh
set -eux


which gh >/dev/null || {
  printf "ERROR: gh it not installed" && exit 1
}

repo_owner="prusa3d"
repo_name="PrusaSlicer"
install_dir="/opt/$repo_owner/$repo_name"
filename="$repo_name"
symlink="$HOME/bin/$filename"


query="
query { 
  repository(name: \"$repo_name\", owner: \"$repo_owner\") {
    name
    latestRelease {
      name
      url
    	releaseAssets(first: 20) {
        nodes {
          name
          url
          downloadUrl
        }
      }
    }
  }
}
"

url=$(gh api graphql -f query="$query" | jq -r '
  .data.repository.latestRelease.releaseAssets.nodes[]
  | select(.name|test("linux-x64-GTK3.*AppImage$"))
  | .downloadUrl'
)


sudo mkdir -p "$install_dir"
sudo chown -R "$(whoami):" "$install_dir"
cd "$install_dir"

wget "$url" -O "$filename"
chmod +x "$filename"

[ -L "$symlink" ] || ln -s "$install_dir/$filename" "$symlink"
