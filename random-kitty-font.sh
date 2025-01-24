#!/bin/bash
FONTS=(
    "Berkeley Mono"
    "RandyGG"
    "IosevkaTermSlab Nerd Font Mono"
    "Space Mono for Powerline"
    "JetBrainsMono Nerd Font"
    "Victor Mono"
    "CommitMono"
    "IosevkaTermSlab Nerd Font Mono"
    "Recursive Mono"
    "MonoLisa Nerd Font"
    "Monaspace Argon"
    "PragmataPro for Powerline"
    "Fragment Mono"
    "Iosevka Custom"
    "IBM Plex Mono"
    "Maple Mono"
    "ZedMono Nerd Font"
    "DM Mono"
    "SF Mono"
    "Roboto Mono for Powerline"
    "RobotoMono Nerd Font"
    "PragmataPro for Powerline"
    "GeistMono"
    "Superstudio LL"
    # Add more fonts here
)

RANDOM_FONT=${FONTS[$RANDOM % ${#FONTS[@]}]}
echo "font_family $RANDOM_FONT" > ~/.config/kitty/current_font.conf
