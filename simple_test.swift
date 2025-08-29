import AppKit

print("🔧 Testing GUI capabilities...")

let app = NSApplication.shared
app.setActivationPolicy(.regular)

let window = NSWindow(
    contentRect: NSRect(x: 100, y: 100, width: 400, height: 300),
    styleMask: [.titled, .closable],
    backing: .buffered,
    defer: false
)

window.title = "Simple Test Window"
window.makeKeyAndOrderFront(nil)
app.activate(ignoringOtherApps: true)

print("✅ Window created and should be visible")
print("📍 Window frame: \(window.frame)")
print("🔍 Window is visible: \(window.isVisible)")
print("🖥️ Display info: \(NSScreen.main?.frame ?? CGRect.zero)")

// Keep the app running
RunLoop.main.run()