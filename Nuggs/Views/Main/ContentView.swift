import SwiftUI

struct ContentView: View {
    @State private var selectedModel: AIModel = .claude
    @State private var inputText: String = ""
    @StateObject private var floatingManager = FloatingWindowManager.shared

    var body: some View {
        ZStack(alignment: .top) {
            // Main Content Canvas
            VStack {
                Spacer()

                // Conversational canvas (empty for now)

                Spacer()

                // Input Bar at the bottom
                InputBarView(text: $inputText)
            }

            // Top Model Selector
            ModelSelectorView(selectedModel: $selectedModel)
                .padding(.top, 16)
        }
        .frame(width: 600, height: 400) // Default sizing
        .background(
            VisualEffectView(material: .hudWindow, blendingMode: .behindWindow, state: .active)
                .edgesIgnoringSafeArea(.all)
                // Adjust blur subtly when moving
                .opacity(floatingManager.isMoving ? 0.95 : 1.0)
                .animation(.easeInOut(duration: 0.3), value: floatingManager.isMoving)
        )
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        // Dynamic depth & shadow behavior
        .shadow(
            color: Color.black.opacity(floatingManager.isMoving ? 0.3 : 0.2),
            radius: floatingManager.isMoving ? 25 : 20,
            x: 0,
            y: floatingManager.isMoving ? 15 : 10
        )
        // Subtle spatial elevation scale
        .scaleEffect(floatingManager.isMoving && !floatingManager.isHovered ? 1.02 : 1.0)
        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: floatingManager.isMoving)
        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: floatingManager.isHovered)
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
        // Extract window and link to FloatingWindowManager
        .configureWindow { window in
            guard let window = window else { return }
            window.isOpaque = false
            window.backgroundColor = .clear
            window.titlebarAppearsTransparent = true
            window.titleVisibility = .hidden
            window.styleMask.insert(.fullSizeContentView)
            // It floats via the manager, so we typically do not want it easily movable by dragging
            // but we leave it enabled inside the interaction area if the user explicitly drags it.
            window.isMovableByWindowBackground = true

            // Connect to manager
            FloatingWindowManager.shared.window = window
        }
    }
}
