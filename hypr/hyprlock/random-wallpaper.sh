#!/usr/bin/env bash

dir="$HOME/.config/hypr/hyprlock/wallpapers"
mapfile -d '' -t files < <(
    find "$dir" -maxdepth 1 -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \
           -o -iname '*.webp' -o -iname '*.avif' \) \
        -print0
)

if ((${#files[@]} == 0)); then
    printf 'No wallpapers found in %s\n' "$dir" >&2
    exit 1
fi

printf '%s\n' "${files[RANDOM % ${#files[@]}]}"
