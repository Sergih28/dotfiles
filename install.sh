#!/usr/bin/env bash

# Packages that need to be installed
# alacritty
# bspwm

DOTFILES_DIR="$HOME/.dotfiles"

# Define list of dotfiles to symlink
DOTFILES=(
    ".config/alacritty"
    ".config/bspwm"
)

# Create symlinks for each dotfile
for folder in "${DOTFILES[@]}"; do
    link="$DOTFILES_DIR/$folder"
    target="$HOME/$folder"

    # Check if the symlink exists and points to the correct location
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$link" ]; then
        echo "Symbolic link for $folder already exists and points to the correct location, skipping..."
    else
        echo "Adding symlink for $folder"
        mkdir -p "$(dirname "$target")"  # Create parent directory if it doesn't exist
        ln -sf "$link" "$target"
    fi
done

echo "Dotfiles installation complete!"
