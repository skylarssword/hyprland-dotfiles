#!/bin/bash

if hyprctl activewindow -j | grep -q '"class":"kitty"'; then
    hyprctl dispatch togglefloating
    sleep 0.05
    hyprctl dispatch resizeactive exact 800 500
else
    hyprctl dispatch togglefloating
fi
