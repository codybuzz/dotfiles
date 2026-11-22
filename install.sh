#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect distro
. /etc/os-release

# common install locations
declare -A INSTALL_LOCATIONS=(
    ["vim/.vimrc"]="${HOME}/.vimrc"
    ["tmux/.tmux.conf"]="${HOME}/.tmux.conf"
    ["nvim"]="${HOME}/.config/nvim"
    ["vscode/settings.json"]="${HOME}/.config/Code/User/settings.json"
    ["vscode/keybindings.json"]="${HOME}/.config/Code/User/keybindings.json"
)

# distro-specific install locations
case "$ID" in
    fedora)
        INSTALL_LOCATIONS["bash/bash_settings"]="${HOME}/.bashrc.d/bash_settings"
        ;;
    ubuntu|debian)
        INSTALL_LOCATIONS["bash/bash_settings"]="${HOME}/.bash_aliases"
        ;;
    *)
        echo "Unsupported distro: $ID" >&2
        exit 1
        ;;
esac

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
