# buddyChatGPT Setup Guide

## Quick Start

1. **Get your OpenAI API Key**
   - Go to https://platform.openai.com/api-keys
   - Create a new API key
   - Copy the key (starts with `sk-`)

2. **Choose Your Method**

### Method A: Direct Swift Execution (EASIEST)
```bash
# Edit the API key in buddyChatGPT_Simple.swift first
swift buddyChatGPT_Simple.swift
```
This runs the app immediately without Xcode!

### Method B: Manual Xcode Project (RECOMMENDED)
See `XCODE_SETUP_GUIDE.md` for step-by-step instructions to create a new Xcode project and copy our files.

### Method C: Try Generated Project
   ```bash
   # Open the project in Xcode
   open buddyChatGPT.xcodeproj
   
   # In Xcode:
   # 1. Select buddyChatGPT target
   # 2. Go to Info tab
   # 3. Add custom property: OPENAI_API_KEY = your_api_key_here
   # 4. Build and run (⌘R)
   ```
   
   **If Xcode shows project file errors:**
   ```bash
   # Use the fixed project generator
   ./fix_project.sh
   # Then open the new project
   open buddyChatGPT.xcodeproj
   ```

3. **For Distribution**
   ```bash
   # Build distribution version
   ./build.sh
   
   # Install on any Mac
   cd dist
   ./install.sh
   ```

## Features in Action

- Type a message and press Enter
- The app automatically takes a screenshot of your screen
- Screenshot is sent to ChatGPT along with your message
- ChatGPT can see and analyze what's on your screen

## System Requirements

- macOS 14.0+
- Internet connection
- OpenAI API key with GPT-4 Vision access
- Screen recording permissions (macOS will prompt)

## Troubleshooting

**"No API key" error:**
- Make sure you added OPENAI_API_KEY to the project Info settings

**Screenshot not working:**
- Grant screen recording permissions in System Preferences > Security & Privacy

**Build fails:**
- Make sure you have Xcode 15.0 or later
- Try running `./download_screenpipe.sh` first

## Privacy

- Screenshots are temporary and sent only to OpenAI
- No data is stored permanently on your device
- Follow OpenAI's usage policies