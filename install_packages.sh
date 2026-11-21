#!/bin/bash

set -e

# Detect distro
. /etc/os-release

COMMON_PACKAGES=(
    git
    curl
    vim
    tmux
    neovim
    ripgrep     # telescope live_grep
    xclip       # neovim clipboard
    gcc         # treesitter parsers, telescope-fzf-native
    make        # telescope-fzf-native
    python3
    python3-argcomplete
)

FEDORA_PACKAGES=(
    clang-tools-extra   # clangd
    python3-ipython
    ruff
)

UBUNTU_PACKAGES=(
    clangd
    ipython3
)

case "$ID" in
    fedora)
        packages=("${COMMON_PACKAGES[@]}" "${FEDORA_PACKAGES[@]}")
        sudo dnf install -y "${packages[@]}"
        ;;
    ubuntu|debian)
        packages=("${COMMON_PACKAGES[@]}" "${UBUNTU_PACKAGES[@]}")
        sudo apt-get update
        sudo apt-get install -y "${packages[@]}"
        ;;
    *)
        echo "Unsupported distro: $ID" >&2
        exit 1
        ;;
esac
