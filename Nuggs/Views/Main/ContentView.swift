import SwiftUI

struct ContentView: View {
    @State private var selectedModel: AIModel = .claude
    @State private var inputText: String = ""

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
        )
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        // Apply soft shadow to the window itself
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
        // A modifier to extract the window and style it
        .configureWindow { window in
            guard let window = window else { return }
            window.isOpaque = false
            window.backgroundColor = .clear
            window.titlebarAppearsTransparent = true
            window.titleVisibility = .hidden
            window.styleMask.insert(.fullSizeContentView)
            // Make it draggable by background
            window.isMovableByWindowBackground = true
        }
    }
}
