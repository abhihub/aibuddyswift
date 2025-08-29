#!/bin/bash

echo "🔍 buddyChatGPT Setup Verification"
echo "=================================="

# Check Xcode project
if [ -f "buddyChatGPT.xcodeproj/project.pbxproj" ]; then
    echo "✅ Xcode project file exists"
else
    echo "❌ Xcode project file missing - run ./fix_project.sh"
    exit 1
fi

# Check source files
REQUIRED_FILES=(
    "buddyChatGPT/buddyChatGPTApp.swift"
    "buddyChatGPT/ContentView.swift"
    "buddyChatGPT/ChatService.swift"
    "buddyChatGPT/ScreenshotService.swift"
    "buddyChatGPT/MessageModel.swift"
    "buddyChatGPT/buddyChatGPT.entitlements"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ Missing: $file"
        exit 1
    fi
done

# Check Assets
if [ -d "buddyChatGPT/Assets.xcassets" ]; then
    echo "✅ Assets.xcassets directory"
else
    echo "❌ Missing Assets.xcassets"
fi

# Check Screenpipe binary
if [ -f "buddyChatGPT/Resources/screenpipe" ]; then
    echo "✅ Screenpipe binary ($(du -h buddyChatGPT/Resources/screenpipe | cut -f1))"
    if [ -x "buddyChatGPT/Resources/screenpipe" ]; then
        echo "✅ Screenpipe binary is executable"
    else
        echo "⚠️  Screenpipe binary not executable - fixing..."
        chmod +x buddyChatGPT/Resources/screenpipe
        echo "✅ Fixed Screenpipe permissions"
    fi
else
    echo "❌ Screenpipe binary missing - run ./download_screenpipe.sh"
    exit 1
fi

# Check build scripts
SCRIPTS=("build.sh" "download_screenpipe.sh" "fix_project.sh")
for script in "${SCRIPTS[@]}"; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        echo "✅ $script"
    else
        echo "⚠️  $script not executable - fixing..."
        chmod +x "$script" 2>/dev/null || echo "❌ $script missing"
    fi
done

# Check documentation
DOCS=("README.md" "SETUP.md" "PROJECT_DOCUMENTATION.md")
for doc in "${DOCS[@]}"; do
    if [ -f "$doc" ]; then
        echo "✅ $doc"
    else
        echo "⚠️  Missing documentation: $doc"
    fi
done

echo ""
echo "🎉 Setup verification complete!"
echo ""
echo "Next steps:"
echo "1. Open buddyChatGPT.xcodeproj in Xcode"
echo "2. Add your OpenAI API key in project settings"
echo "3. Build and run (⌘R)"
echo ""
echo "If you encounter issues, run ./fix_project.sh to regenerate the project file."