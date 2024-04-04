set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

tar_filename=eza_"$(uname -m)"-unknown-linux-$clib_type.tar.gz

# This is a prepopulated version of https://github.com/devcontainers-contrib/features/blob/main/src/gh-release/install.sh
$nanolayer_location \
   install gh-release \
   'eza-community/eza' \
   "eza" --force \
   --asset-regex "$tar_filename" \
   --version "$VERSION" 

echo 'Done!'

