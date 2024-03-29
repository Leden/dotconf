#!/bin/sh
set -e

dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)

which gh >/dev/null || {
  printf "ERROR: gh it not installed" && exit 1
}

repo_owner="freecad"
repo_name="freecad"
install_dir="/opt/$repo_owner/$repo_name"
filename="$repo_name"
symlink="$HOME/bin/$filename"

query="
query { 
  repository(name: \"$repo_name\", owner: \"$repo_owner\") {
    name
    releases(last: 20) {
      nodes {
        name
        url
        isLatest
      	releaseAssets(first: 20) {
          nodes {
            name
            url
          }
        }
      }
    }
  }
}
"

url=$(gh api graphql -f query="$query" | jq -r '
  .data.repository.releases.nodes[]
  | select(.isLatest==true)
  | .releaseAssets.nodes[]
  | select(.name|test("Linux.*AppImage$"))
  | .url'
)

sudo mkdir -p "$install_dir"
sudo chown -R "$(whoami):" "$install_dir"
cd "$install_dir"

wget "$url" -O "$filename"
chmod +x "$filename"

[ -L "$symlink" ] || ln -s "$install_dir/$filename" "$symlink"
