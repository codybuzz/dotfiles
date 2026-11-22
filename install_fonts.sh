#!/bin/bash

set -e

NERD_FONTS_VERSION="v3.5.1"
FONTS=(
    AdwaitaMono
)

FONTS_DIR="${HOME}/.local/share/fonts"

for font in "${FONTS[@]}"; do
    font_dir="$FONTS_DIR/$font"
    version_file="$font_dir/.version"

    # Skip if this version is already installed
    if [ -f "$version_file" ] && [ "$(cat "$version_file")" == "$NERD_FONTS_VERSION" ]; then
        continue
    fi

    tmp_dir="$(mktemp -d)"
    trap 'rm -rf "$tmp_dir"' EXIT

    url="https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONTS_VERSION}/${font}.zip"
    curl -fL -o "$tmp_dir/$font.zip" "$url"

    # Replace any previous install
    rm -rf "$font_dir"
    mkdir -p "$font_dir"
    unzip -q -o "$tmp_dir/$font.zip" -d "$font_dir"
    echo "$NERD_FONTS_VERSION" > "$version_file"

    rm -rf "$tmp_dir"
    trap - EXIT
done

fc-cache -f "$FONTS_DIR"
