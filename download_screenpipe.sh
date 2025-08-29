#!/bin/bash

set -e

echo "Downloading Screenpipe binary for macOS..."

ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    DOWNLOAD_ARCH="x86_64"
elif [[ "$ARCH" == "arm64" ]]; then
    DOWNLOAD_ARCH="aarch64"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

SCREENPIPE_VERSION="v0.2.74"
DOWNLOAD_URL="https://github.com/mediar-ai/screenpipe/releases/download/${SCREENPIPE_VERSION}/screenpipe-0.2.74-${DOWNLOAD_ARCH}-apple-darwin.tar.gz"

TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "Downloading from: $DOWNLOAD_URL"
curl -L -o screenpipe.tar.gz "$DOWNLOAD_URL"

echo "Extracting screenpipe binary..."
tar -xzf screenpipe.tar.gz

BINARY_PATH="./bin/screenpipe"

if [[ ! -f "$BINARY_PATH" ]]; then
    echo "Error: screenpipe binary not found at $BINARY_PATH"
    exit 1
fi

RESOURCES_DIR="$(dirname "$0")/buddyChatGPT/Resources"
mkdir -p "$RESOURCES_DIR"

cp "$BINARY_PATH" "$RESOURCES_DIR/screenpipe"
chmod +x "$RESOURCES_DIR/screenpipe"

echo "Screenpipe binary successfully downloaded to: $RESOURCES_DIR/screenpipe"

cd - > /dev/null
rm -rf "$TEMP_DIR"

echo "Done!"