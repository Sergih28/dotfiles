#!/usr/bin/env bash

# Packages that need to be installed
# alacritty

DOTFILES_DIR="$HOME/.dotfiles"

# Define list of dotfiles to symlink
DOTFILES=(
    ".config/alacritty/alacritty.toml"
)

# Create symlinks for each dotfile
for file in "${DOTFILES[@]}"; do
    # Create the folder if it doesn't exist
    mkdir -p "$(dirname $HOME/$file)"

    echo "Adding symlink for $file"
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
done

echo "Dotfiles installation complete!"
