#!/bin/bash

set -e

echo "Building buddyChatGPT for distribution..."

# Ensure we have the latest Screenpipe binary
if [ ! -f "buddyChatGPT/Resources/screenpipe" ]; then
    echo "Downloading Screenpipe binary..."
    ./download_screenpipe.sh
fi

# Build the app
echo "Building the app..."
xcodebuild -project buddyChatGPT.xcodeproj -scheme buddyChatGPT -configuration Release -derivedDataPath ./build clean build

# Create distribution folder
DIST_DIR="./dist"
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

# Copy the built app
BUILD_DIR="./build/Build/Products/Release"
cp -R "$BUILD_DIR/buddyChatGPT.app" "$DIST_DIR/"

# Create a simple installer script
cat > "$DIST_DIR/install.sh" << 'EOF'
#!/bin/bash

echo "Installing buddyChatGPT..."

# Copy app to Applications folder
cp -R buddyChatGPT.app /Applications/

echo "buddyChatGPT has been installed to /Applications/"
echo "You can now run it from Launchpad or Finder."
echo ""
echo "Don't forget to add your OpenAI API key:"
echo "1. Right-click on buddyChatGPT.app in Applications"
echo "2. Select 'Get Info'"
echo "3. Add your API key in the app's Info.plist under OPENAI_API_KEY"
echo ""
echo "Or contact the developer for setup assistance."
EOF

chmod +x "$DIST_DIR/install.sh"

# Create README for distribution
cat > "$DIST_DIR/README.txt" << 'EOF'
buddyChatGPT - ChatGPT with Screenshots

SETUP INSTRUCTIONS:

1. Run the install.sh script to install the app to your Applications folder
2. You'll need to add your OpenAI API key to use the app
3. The app will automatically capture screenshots with each message

REQUIREMENTS:
- macOS 14.0 or later
- OpenAI API key
- Internet connection

For support or questions, please refer to the project documentation.
EOF

echo "Build complete! Distribution files are in the ./dist folder"
echo "To install: cd dist && ./install.sh"