#!/bin/bash
# Spooky Dash - Godot Installation Script

set -e

echo "=== Spooky Dash - Godot Setup ==="
echo ""

# Create bin directory
mkdir -p ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

echo "Downloading Godot 4.2.2..."
cd ~/.local/bin

# Try multiple mirrors
GODOT_VERSION="4.2.2"
GODOT_FILE="Godot_v${GODOT_VERSION}-stable_linux.x86_64.zip"
GODOT_BINARY="Godot_v${GODOT_VERSION}-stable_linux.x86_64"

# Try GitHub first
echo "Attempting GitHub download..."
if curl -L -o "$GODOT_FILE" "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}-stable/${GODOT_FILE}" 2>/dev/null; then
    echo "✓ Downloaded from GitHub"
elif curl -L -o "$GODOT_FILE" "https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/${GODOT_FILE}" 2>/dev/null; then
    echo "✓ Downloaded from tuxfamily"
else
    echo "✗ Failed to download from both sources"
    exit 1
fi

echo "Extracting..."
unzip -q "$GODOT_FILE"
chmod +x "$GODOT_BINARY"
ln -sf "$GODOT_BINARY" godot
rm "$GODOT_FILE"

echo ""
echo "✓ Godot installed to ~/.local/bin/godot"
echo ""
echo "To open the Spooky Dash project, run:"
echo "  godot -e ~/dev/spooky"
echo ""
echo "To run the game:"
echo "  godot ~/dev/spooky"
