#!/bin/bash

# ==============================================================================
# HathCursor Cross-Platform Build & Organization Script
# ==============================================================================

echo "🚀 Starting HathCursor theme generation..."

# 1. Setup the standardized directory layout
echo "📁 Creating cross-platform directories..."
mkdir -p source_pngs linux/HathCursor/cursors windows macos

# 2. Safely relocate loose PNG files if they exist in the root
if [ -f "left_ptr.png" ] || [ -f "hand1.png" ] || [ -f "openhand.png" ] || [ -f "grabbing.png" ]; then
    echo "📦 Moving raw PNG files to source_pngs/..."
    mv left_ptr.png hand1.png openhand.png grabbing.png source_pngs/ 2>/dev/null
fi

# Verify source files exist before proceeding
if [ ! -f "source_pngs/left_ptr.png" ]; then
    echo "❌ Error: Could not find source_pngs/left_ptr.png. Make sure your PNG images are present!"
    exit 1
fi

# 3. Compile Linux X11 Cursors using xcursorgen
echo "🔨 Compiling binary cursors for Linux..."
xcursorgen <(echo "32 0 0 source_pngs/left_ptr.png") linux/HathCursor/cursors/left_ptr
xcursorgen <(echo "32 0 0 source_pngs/hand1.png") linux/HathCursor/cursors/hand1
xcursorgen <(echo "32 0 0 source_pngs/openhand.png") linux/HathCursor/cursors/openhand
xcursorgen <(echo "32 0 0 source_pngs/grabbing.png") linux/HathCursor/cursors/grabbing

# 4. Generate mandatory Linux X11 cursor symlinks/aliases
echo "🔗 Generating cursor aliases and fallbacks..."
cd linux/HathCursor/cursors/ || exit 1
ln -sf left_ptr default
ln -sf left_ptr left_ptr_watch
ln -sf hand1 pointer
ln -sf hand1 pointing_hand
ln -sf hand1 text
ln -sf openhand openhand
ln -sf grabbing closedhand
ln -sf grabbing move
cd ../../../

# 5. Generate Linux Theme Metadata File
echo "📝 Writing Linux index.theme file..."
cat << 'EOF' > linux/HathCursor/index.theme
[Icon Theme]
Name=HathCursor
Comment=My custom real-life hand cursor theme
Inherits=adwaita
Example=left_ptr
EOF

echo "✨ Build completed successfully!"
echo "----------------------------------------"
echo "👉 Next Steps:"
echo "1. Run 'cp -r linux/HathCursor ~/.icons/' to install on your Linux Mint system."
echo "2. Open 'Themes -> Mouse Pointer' and select 'HathCursor'."
# 6. Package for Release
echo "📦 Packaging distributions for GitHub Releases..."
# Package for Linux users
tar -czf HathCursor-Linux.tar.gz -C linux HathCursor
# Package for Windows and Mac users
zip -r HathCursor-Windows-Mac.zip windows macos source_pngs
