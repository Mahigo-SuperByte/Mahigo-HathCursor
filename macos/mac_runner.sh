#!/bin/bash
TARGET_DIR="$HOME/Library/Application Support/Mousecape/Capes"
mkdir -p "$TARGET_DIR"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp -R "$SCRIPT_DIR/HathCursor.cape" "$TARGET_DIR/"
osascript -e 'display dialog "HathCursor successfully imported into Mousecape!" buttons {"OK"} default button "OK"'
