#!/bin/bash
FONTS=(
    "Berkeley Mono"
    "RandyGG"
    "IosevkaTermSlab Nerd Font Mono"
    "Space Mono for Powerline"
    "GeistMono Nerd Font"
    "JetBrainsMono Nerd Font"
    "Iosevka Custom"
    "Victor Mono"
    "CommitMono"
    "Recursive Mono"
    "MonoLisa Nerd Font"
    "Monaspace Argon"
    "PragmataPro for Powerline"
    "Fragment Mono"
    "IBM Plex Mono"
    "Maple Mono"
    "ZedMono Nerd Font"
    "DM Mono"
    "SF Mono"
    "Roboto Mono for Powerline"
    "RobotoMono Nerd Font"
    "PragmataPro for Powerline"
    "Superstudio LL"
    # Add more fonts here
)

RANDOM_FONT=${FONTS[$RANDOM % ${#FONTS[@]}]}
echo "font_family $RANDOM_FONT" > ~/.config/kitty/current_font.conf
