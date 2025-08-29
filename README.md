# buddyChatGPT

A simple macOS app that works like ChatGPT with automatic screenshot integration using Screenpipe.

## Features

- Simple ChatGPT-like interface
- Automatically captures screenshot with each message
- Integrates Screenpipe for enhanced screen capture capabilities
- Clean, minimal UI designed for macOS
- Bundled Screenpipe binary - no separate installation required

## Setup

### Prerequisites

- macOS 14.0 or later
- Xcode 15.0 or later (for development)
- OpenAI API key

### Installation

1. Clone this repository
2. Open `buddyChatGPT.xcodeproj` in Xcode
3. Add your OpenAI API key:
   - Open the project in Xcode
   - Select the buddyChatGPT target
   - Go to Info tab
   - Add a new key: `OPENAI_API_KEY` with your API key as the value
4. Build and run the project

### Distribution

The app includes a bundled Screenpipe binary, so users don't need to install Screenpipe separately.

To build for distribution:
1. Set the build configuration to Release
2. Archive the project
3. Export for distribution outside the Mac App Store (for now, due to Screenpipe binary)

## Architecture

- **ContentView**: Main chat interface using SwiftUI
- **ChatService**: Handles OpenAI API communication with vision capabilities
- **ScreenshotService**: Manages screen captures and Screenpipe integration
- **MessageModel**: Data models for chat messages and API requests

## Privacy & Permissions

The app requires:
- Network access for ChatGPT API calls
- Screenshot permissions for screen capture
- Temporary file access for storing screenshots

## Development

To update the Screenpipe binary:
```bash
./download_screenpipe.sh
```

This will download the latest Screenpipe binary for your architecture and place it in the Resources folder.

## License

This project is for educational purposes. Please ensure you comply with OpenAI's usage policies when using the ChatGPT API.