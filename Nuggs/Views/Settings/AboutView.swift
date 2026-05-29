import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 32) {
            // App Icon & Info Section
            VStack(spacing: 16) {
                // Placeholder for App Icon
                ZStack {
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.8), Color.gray.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 140, height: 140)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 32, style: .continuous)
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                        )

                    // Simple representation of the icon from the image
                    VStack(spacing: 0) {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 16, height: 16)
                            .offset(x: 40, y: -20)
                            .shadow(color: Color.yellow.opacity(0.5), radius: 4)

                        Image(systemName: "star.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.2), radius: 4)
                            .padding(.top, 10)
                    }
                }
                .padding(.top, 20)

                VStack(spacing: 8) {
                    Text("AI at the shaking of your mouse")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)

                    Text("Nuggs 1.0v")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.secondary.opacity(0.8))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(nsColor: .windowBackgroundColor).opacity(0.4))
                    .background(VisualEffectView(material: .popover, blendingMode: .withinWindow).clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous)))
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
            )

            Spacer()

            // Creator Banner
            Text("Created with ❤️ By Harshit")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.blue)
                        .shadow(color: Color.blue.opacity(0.4), radius: 8, x: 0, y: 4)
                )
        }
        .padding(24)
    }
}
