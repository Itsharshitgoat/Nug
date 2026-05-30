import SwiftUI
import AppKit

// Extension to allow custom window styling like removing title bar while keeping it draggable
struct WindowAccessor: NSViewRepresentable {
    let callback: (NSWindow?) -> Void

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            self.callback(view.window)
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}

extension View {
    func configureWindow(callback: @escaping (NSWindow?) -> Void) -> some View {
        self.background(WindowAccessor(callback: callback))
    }
}
