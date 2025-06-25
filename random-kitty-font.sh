#!/bin/bash

# Fonts available on your system (from kitty +list-fonts)
FONTS=(
    "Andale Mono"
    "Berkeley Mono"
    "BlexMono Nerd Font Mono"
    "DM Mono"
    "DroidSansMono Nerd Font"
    "DroidSansMono Nerd Font Mono"
    "DroidSansMono NF"
    "FiraCode Nerd Font Mono"
    "FiraMono Nerd Font Mono"
    "Geist Mono"
    "GeistMono Nerd Font Mono"
    "Gintronic"
    "Google Sans Mono"
    "Hack iCursive S12"
    "IBM Plex Mono"
    "InconsolataLGC Nerd Font Mono"
    "InconsolataLGC NF"
    "Intel One Mono"
    "Iosevka Custom"
    "Iosevka Nerd Font Mono"
    "JetBrains Mono"
    "JetBrains Mono NL"
    "Lantinghei TC"
    "Menlo"
    "Meslo iCursive S12"
    "Monaco"
    "Operator Mono Lig"
    "Osaka"
    "PCMyungjo"
    "PT Mono"
    "Recursive Code iCursive Cg"
    "Roboto Mono iCursive Pt"
    "RobotoMono Nerd Font"
    "RobotoMono Nerd Font Mono"
    "SF Mono"
    "Source Code Pro iCursive S12"
    "SpaceMono Nerd Font"
    "SpaceMono Nerd Font Mono"
    "Victor Mono"
    "VictorMono Nerd Font Mono"
    "Zed Mono"
    "ZedMono Nerd Font Mono"
    # "RandyGG"  # Unavailable
    # "IosevkaTermSlab Nerd Font Mono"  # Unavailable
    # "Space Mono for Powerline"  # Unavailable
    # "JetBrainsMono Nerd Font"  # Unavailable
    # "Recursive Mono"  # Unavailable
    # "GeistMono Nerd Font"  # Unavailable (note: "GeistMono Nerd Font Mono" is available)
    # "CommitMono"  # Unavailable
    # "MonoLisa Nerd Font"  # Unavailable
    # "Monaspace Argon"  # Unavailable
    # "PragmataPro for Powerline"  # Unavailable
    # "Fragment Mono"  # Unavailable
    # "Maple Mono"  # Unavailable
    # "ZedMono Nerd Font"  # Unavailable (note: "ZedMono Nerd Font Mono" is available)
    # "Roboto Mono for Powerline"  # Unavailable
    # "RobotoMono Nerd Font"  # Unavailable (note: "RobotoMono Nerd Font Mono" is available)
    # "PragmataPro for Powerline"  # Unavailable
    # "Superstudio LL"  # Unavailable
)

# Italic-compatible fonts (subset of available fonts)
ITALIC_FONTS=(
    "Iosevka Custom"
    "JetBrains Mono"
    "SF Mono"
    "IBM Plex Mono"
    "BlexMono Nerd Font Mono"  # Likely supports italics based on "Styles: Italic"
    "FiraCode Nerd Font Mono"  # Likely supports italics
    # "RandyGG"  # Unavailable
    # "IosevkaTermSlab Nerd Font Mono"  # Unavailable
    # "Space Mono for Powerline"  # Unavailable
    # "JetBrainsMono Nerd Font"  # Unavailable
    # "Recursive Mono"  # Unavailable
    # "GeistMono Nerd Font"  # Unavailable (note: "GeistMono Nerd Font Mono" is available but not added here for italics)
    # "CommitMono"  # Unavailable
    # "MonoLisa Nerd Font"  # Unavailable
    # "Monaspace Argon"  # Unavailable
    # "PragmataPro for Powerline"  # Unavailable
    # "Fragment Mono"  # Unavailable
    # "Maple Mono"  # Unavailable
    # "ZedMono Nerd Font"  # Unavailable (note: "ZedMono Nerd Font Mono" is available but not added here for italics)
    # "Roboto Mono for Powerline"  # Unavailable
    # "RobotoMono Nerd Font"  # Unavailable (note: "RobotoMono Nerd Font Mono" is available but not added here for italics)
    # "PragmataPro for Powerline"  # Unavailable
    # "Superstudio LL"  # Unavailable
)

# Select random fonts
RANDOM_FONT=${FONTS[$RANDOM % ${#FONTS[@]}]}
RANDOM_ITALIC_FONT=${ITALIC_FONTS[$RANDOM % ${#ITALIC_FONTS[@]}]}

# Update Kitty's config
echo "font_family $RANDOM_FONT" > ~/.config/kitty/current_font.conf
echo "italic_font $RANDOM_ITALIC_FONT" >> ~/.config/kitty/current_font.conf
echo "bold_italic_font $RANDOM_ITALIC_FONT" >> ~/.config/kitty/current_font.conf

# Confirm the change
echo "Updated Kitty font to font_family=$RANDOM_FONT, italic_font=$RANDOM_ITALIC_FONT, bold_italic_font=$RANDOM_ITALIC_FONT"
