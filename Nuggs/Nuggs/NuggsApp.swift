import SwiftUI
import AppKit

@main
struct NuggsApp: App {
    // Hide standard menu bar for main window (to make it a floating app)
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        // Main AI Window
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())

        // Settings Window
        Settings {
            SettingsView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Run in the background (no Dock icon) as requested
        NSApp.setActivationPolicy(.accessory)
        
        // Listen for cmd+, to open settings
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
            if event.modifierFlags.contains(.command) && event.characters == "," {
                NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
                return nil
            }
            return event
        }
        
        // Load icon from package resources (Settings/About will use this)
        if let url = Bundle.module.url(forResource: "icon", withExtension: "icns", subdirectory: "Resources"),
           let image = NSImage(contentsOf: url) {
            NSApp.applicationIconImage = image
        }
    }
}
