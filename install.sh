#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define a map of repo config to install location
declare -A INSTALL_LOCATIONS=(
    ["vim/.vimrc"]="${HOME}/.vimrc"
    ["tmux/.tmux.conf"]="${HOME}/.tmux.conf"
    ["nvim"]="${HOME}/.config/nvim"
    ["bash/bash_aliases"]="${HOME}/.bashrc.d/bash_aliases"
)

for src_path in "${!INSTALL_LOCATIONS[@]}"; do
    src_path_full="$DOTFILES_DIR/$src_path"
    dst_path=${INSTALL_LOCATIONS[$src_path]}
    parent="${dst_path%/*}"

    # Ensure parent dir exists first
    mkdir -p $parent

    # If symlink exists and points to right spot, do nothing
    if [ -L "$dst_path" ] && [ "$(readlink $dst_path)" == "$src_path_full" ]; then
        continue
    fi

    # Backup existing file if it exists
    if [ -e "$dst_path" ] && [ ! -L "$dst_path" ]; then
        mv "$dst_path" "$dst_path.old"
    fi

    ln -s "$src_path_full" "$dst_path"
done
