#!/bin/bash

echo "🚀 Starting Master Installer Compiler on Linux..."
mkdir -p dist

# ==========================================
# 🐧 1. BUILD LINUX DEBIAN PACKAGE (.deb)
# ==========================================
echo "📦 Building Linux Mint/Ubuntu .deb installer..."
mkdir -p deb_build/DEBIAN
mkdir -p deb_build/usr/share/icons/HathCursor

# Copy Linux theme files generated from your build_theme.sh
cp -r linux/HathCursor/* deb_build/usr/share/icons/HathCursor/ 2>/dev/null

cat << 'EOF' > deb_build/DEBIAN/control
Package: hathcursor
Version: 1.0.0
Section: misc
Priority: optional
Architecture: all
Maintainer: Mahir <mahir@example.com>
Description: Mahir's custom real-life hand cursor theme from Bangladesh.
 Compatible cross-desktop across Linux Mint Cinnamon, MATE, and XFCE.
EOF

dpkg-deb --build deb_build dist/hathcursor_1.0.0_all.deb
rm -rf deb_build

# ==========================================
# 🪟 2. BUILD WINDOWS EXECUTABLE (.exe)
# ==========================================
echo "⚙️  Compiling Windows Native .exe Installer using NSIS..."
if [ -f "windows_installer.nsi" ]; then
    makensis windows_installer.nsi
    mv HathCursor-Installer.exe dist/
else
    echo "⚠️  Skipping Windows compilation: windows_installer.nsi not found."
fi

# ==========================================
# 🍏 3. BUILD MACOS APP BUNDLE (.app)
# ==========================================
echo "🍏 Creating macOS Installer App Bundle..."
APP_DIR="dist/HathCursorInstaller.app/Contents"
mkdir -p "$APP_DIR/MacOS"
mkdir -p "$APP_DIR/Resources"

# Generate simple Info.plist metadata for macOS
cat << 'EOF' > "$APP_DIR/Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://apple.com">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>mac_runner.sh</string>
    <key>CFBundleIdentifier</key>
    <string>com.mahir.hathcursor.installer</string>
    <key>CFBundleName</key>
    <string>HathCursor Installer</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
</dict>
</plist>
EOF

# Inject the script and config properties inside the bundle
cp mac_runner.sh "$APP_DIR/MacOS/mac_runner.sh"
chmod +x "$APP_DIR/MacOS/mac_runner.sh"
cp macos/HathCursor.cape "$APP_DIR/MacOS/HathCursor.cape" 2>/dev/null

# Zip it up because macOS requires App bundles to be distributed as zip files on web platforms
cd dist/ && zip -r HathCursorInstaller-Mac.zip HathCursorInstaller.app/ > /dev/null && rm -rf HathCursorInstaller.app/ && cd ..

echo "✨ All cross-platform applications built successfully on Linux!"
echo "📂 Check your 'dist/' folder for the finished products:"
ls -l dist/
