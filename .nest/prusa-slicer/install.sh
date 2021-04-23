#!/bin/sh
set -e


which gh >/dev/null || {
  printf "ERROR: gh it not installed" && exit 1
}

repo_owner="prusa3d"
repo_name="PrusaSlicer"
install_dir="/opt/$repo_owner/$repo_name"
filename="$repo_name"

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
  | select(.name|test("GTK3.*AppImage$"))
  | .url'
)


sudo mkdir -p "$install_dir"
sudo chown -R "$(whoami):" "$install_dir"
cd "$install_dir"

wget "$url" -O "$filename"
chmod +x "$filename"

ln -s "$install_dir/$filename" "$HOME/bin/$filename"
