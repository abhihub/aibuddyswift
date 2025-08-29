# Manual Xcode Project Setup Guide

Since the generated Xcode project files are having issues, here's how to create a working project manually:

## Method 1: Quick Test (Recommended)

Run the app directly without Xcode:

```bash
# Run the simple version directly
swift buddyChatGPT_Simple.swift
```

This will open a working buddyChatGPT window immediately!

## Method 2: Create New Xcode Project

1. **Open Xcode**
2. **Create New Project**:
   - Choose "macOS" → "App"
   - Product Name: `buddyChatGPT`
   - Interface: SwiftUI
   - Language: Swift

3. **Replace the default files**:
   - Replace `ContentView.swift` with our `buddyChatGPT/ContentView.swift`
   - Replace the App file with our `buddyChatGPT/buddyChatGPTApp.swift`
   - Add new files:
     - `ChatService.swift` → copy from `buddyChatGPT/ChatService.swift`
     - `ScreenshotService.swift` → copy from `buddyChatGPT/ScreenshotService.swift`
     - `MessageModel.swift` → copy from `buddyChatGPT/MessageModel.swift`

4. **Add Resources**:
   - Drag `buddyChatGPT/Resources/screenpipe` into the project
   - Make sure "Copy items if needed" is checked
   - Add to target

5. **Configure Entitlements**:
   - Add new file → Property List → `buddyChatGPT.entitlements`
   - Copy contents from our `buddyChatGPT/buddyChatGPT.entitlements`
   - In project settings, set Code Sign Entitlements to this file

6. **Add API Key**:
   - In project settings → Info tab
   - Add custom property: `OPENAI_API_KEY` = your_api_key_here

## Method 3: Copy Working Files

If you have issues with the generated project, you can:

1. **Use the existing source files** in the `buddyChatGPT/` directory
2. **Reference the Swift Package** using `Package.swift`
3. **Run from command line**: `swift run` (if using Package.swift)

## Testing the Setup

1. **Quick test**: `swift buddyChatGPT_Simple.swift`
2. **Verify files**: `./verify_setup.sh`
3. **Check Screenpipe**: `buddyChatGPT/Resources/screenpipe --version`

## Troubleshooting

- **Project won't open**: Use Method 1 (direct Swift execution)
- **Build errors**: Check that all files are added to the target
- **Missing Screenpipe**: Run `./download_screenpipe.sh`
- **API errors**: Make sure you've added your OpenAI API key

## Alternative: Swift Package Manager

The project includes a `Package.swift` file. You can also:

```bash
# Build as Swift package
swift build

# Run as Swift package  
swift run
```

This bypasses Xcode entirely and uses the Swift compiler directly.

---

**The simplest approach is Method 1** - just run `swift buddyChatGPT_Simple.swift` and you'll have a working app immediately!