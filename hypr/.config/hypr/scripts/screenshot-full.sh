#!/usr/bin/env bash
# Instantly capture the full screen, no menu/prompt. Saves + copies to clipboard.

mkdir -p "$HOME/Pictures/Screenshots"

hyprshot -m output -m active -s
