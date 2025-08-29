# buddyChatGPT - Project Documentation

## Project Overview

buddyChatGPT is a Swift macOS application that combines ChatGPT functionality with automatic screenshot integration using Screenpipe. The app provides a simple chat interface where every user message is automatically accompanied by a screenshot of the current screen, allowing ChatGPT to see and analyze what's displayed.

## ✅ Completed Features

### Core Functionality
- **ChatGPT Integration**: Full OpenAI API integration with GPT-4 Vision support
- **Automatic Screenshots**: Every message includes a screenshot of the user's screen
- **Screenpipe Integration**: Bundled Screenpipe binary for enhanced screen capture
- **SwiftUI Interface**: Native macOS chat interface with message bubbles
- **Real-time Chat**: Async message handling with loading states

### Technical Implementation
- **Simple Architecture**: Clean separation of concerns across services
- **Native macOS**: Built specifically for macOS 14.0+ using SwiftUI
- **Bundled Dependencies**: Screenpipe binary included - no separate installation
- **Distribution Ready**: Complete build and deployment scripts

## Architecture

### Core Components

#### 1. **ContentView.swift**
- Main chat interface using SwiftUI
- Message bubble display with timestamps
- Screenshot thumbnail display
- Input field with send functionality
- Auto-scrolling to latest messages

#### 2. **ChatService.swift** 
- OpenAI API communication (@MainActor class)
- GPT-4 Vision integration for image analysis
- Message history management
- Error handling for API calls
- Base64 image encoding for screenshots

#### 3. **ScreenshotService.swift**
- Automatic screenshot capture using macOS screencapture
- Screenpipe binary management and execution
- Fallback screenshot methods
- Temporary file management
- Binary path resolution (bundled vs system)

#### 4. **MessageModel.swift**
- Data structures for chat messages
- OpenAI API request/response models
- Image URL handling for vision API
- Codable implementations for JSON serialization

### Key Features Implementation

#### Screenshot Integration
```swift
// Automatic screenshot with every message
let screenshotPath = await screenshotService.takeScreenshot()
await chatService.sendMessage(trimmedMessage, screenshotPath: screenshotPath)
```

#### Vision API Integration
```swift
// Sends both text and screenshot to GPT-4 Vision
var contentItems: [ContentItem] = [
    ContentItem(type: "text", text: message, imageUrl: nil)
]
if let screenshotPath = screenshotPath {
    let base64Image = try encodeImageToBase64(path: screenshotPath)
    let imageContent = ContentItem(type: "image_url", text: nil, 
        imageUrl: ImageUrl(url: "data:image/png;base64,\(base64Image)"))
    contentItems.append(imageContent)
}
```

#### Bundled Binary Management
```swift
// Looks for bundled Screenpipe binary first
if let resourcePath = Bundle.main.resourcePath {
    let bundledPath = "\(resourcePath)/screenpipe"
    if FileManager.default.fileExists(atPath: bundledPath) {
        screenpipePath = bundledPath
        makeExecutable(path: bundledPath)
        return
    }
}
```

## Project Structure

```
buddyChatGPT/
├── buddyChatGPT.xcodeproj/          # Xcode project files
│   └── project.pbxproj              # Project configuration
├── buddyChatGPT/                    # Source code
│   ├── buddyChatGPTApp.swift        # Main app entry point
│   ├── ContentView.swift            # Main UI interface
│   ├── ChatService.swift            # OpenAI API integration
│   ├── ScreenshotService.swift      # Screenshot & Screenpipe handling
│   ├── MessageModel.swift           # Data models
│   ├── Assets.xcassets/             # App icons and assets
│   ├── buddyChatGPT.entitlements    # App permissions
│   └── Resources/                   # Bundled resources
│       └── screenpipe               # Bundled Screenpipe binary
├── build.sh                         # Distribution build script
├── download_screenpipe.sh           # Screenpipe binary updater
├── README.md                        # User documentation
├── SETUP.md                         # Setup instructions
├── Info.plist.template              # API key configuration template
└── PROJECT_DOCUMENTATION.md         # This file
```

## Distribution & Deployment

### Build Process
1. **Development**: Open in Xcode, add API key, build and run
2. **Distribution**: Use `./build.sh` to create distributable package
3. **Installation**: Users run `./install.sh` from dist folder

### Build Script Features
- Downloads latest Screenpipe binary if missing
- Creates Release build configuration
- Packages app with installer script
- Includes user documentation

### User Setup Requirements
- macOS 14.0 or later
- OpenAI API key (GPT-4 Vision access)
- Screen recording permissions
- Internet connection

## API Integration

### OpenAI Configuration
- **Model**: gpt-4-vision-preview
- **Max Tokens**: 1000
- **System Message**: Instructs AI to analyze screenshots
- **Error Handling**: Comprehensive error types and user feedback

### Required Permissions
- **Network Access**: For OpenAI API calls
- **Screen Recording**: For screenshot capture
- **Temporary Files**: For screenshot storage

## Security & Privacy

### App Sandbox
- Configured with minimal required entitlements
- Network client access for API calls
- Screen recording for screenshots
- Temporary file access for image storage

### Data Handling
- Screenshots stored temporarily, deleted after use
- No persistent storage of chat history
- API key stored in app configuration (not hardcoded)
- Follows OpenAI usage policies

## Future Development Notes

### Potential Enhancements
1. **Chat History Persistence**: Save conversations locally
2. **Multiple Screenshot Modes**: Window-specific, region selection
3. **Screenpipe Features**: Leverage more Screenpipe capabilities
4. **Settings UI**: In-app API key configuration
5. **Export Features**: Save conversations, export screenshots

### Technical Considerations
- **Performance**: Large screenshots may impact API response time
- **Storage**: Consider compression for screenshot data
- **Privacy**: Add option to exclude sensitive areas
- **Updates**: Automatic Screenpipe binary updates

### Known Limitations
- Requires manual API key configuration
- Screenshots always capture full screen
- No offline mode
- Dependent on OpenAI service availability

## Development Environment

### Requirements
- Xcode 15.0 or later
- macOS 14.0+ for development and deployment
- Swift 5.0+
- Valid OpenAI developer account

### Testing
- Test screenshot functionality across different screen configurations
- Verify API integration with various message types
- Test app permissions and sandboxing
- Validate distribution package on clean systems

## Maintenance

### Regular Updates
- Monitor Screenpipe releases for updates (`./download_screenpipe.sh`)
- Update OpenAI API integration as new models become available
- Test compatibility with new macOS versions
- Update dependencies and security patches

### Troubleshooting Common Issues
- **API Key Issues**: Verify key format and permissions
- **Screenshot Problems**: Check system permissions
- **Build Failures**: Ensure Xcode version and clean derived data
- **Performance**: Monitor API usage and response times

## Success Metrics

This project successfully delivered:
✅ Complete working macOS app
✅ ChatGPT integration with vision capabilities  
✅ Automatic screenshot functionality
✅ Bundled Screenpipe integration
✅ Simple, clean UI
✅ Distribution-ready package
✅ Comprehensive documentation
✅ User setup guides

The app is ready for immediate use and distribution to other macOS users.