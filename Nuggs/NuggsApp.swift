import SwiftUI
import AppKit

@main
struct NuggsApp: App {
    // Hide standard menu bar for main window (to make it a floating app)
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        // Main AI Window
        WindowGroup(id: "mainWindow") {
            ContentView()
                // Ensure it floats like a utility window but behaves properly
                .onAppear {
                    if let window = NSApplication.shared.windows.first(where: { $0.identifier?.rawValue == "mainWindow" }) {
                        window.level = .floating
                        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
                    }
                }
        }
        .windowStyle(HiddenTitleBarWindowStyle())

        // Settings Window
        Settings {
            SettingsView()
                .onAppear {
                    if let window = NSApplication.shared.windows.first(where: { $0.title == "Settings" }) {
                        window.level = .floating
                        window.collectionBehavior = [.canJoinAllSpaces]
                    }
                }
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Hide the main menu bar to make it feel more integrated
        NSApp.setActivationPolicy(.accessory)
    }
}
