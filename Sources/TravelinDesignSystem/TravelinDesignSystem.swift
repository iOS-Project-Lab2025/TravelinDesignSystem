#if canImport(SwiftUI)
import SwiftUI

// MARK: - What is this file?
// Here we define a reusable button for our Design System.
// It is built with SwiftUI.
// Single variation: a blue, rounded button with white text.

// MARK: - DSPrimaryButton
/// The button from our Design System.
///
/// How to use it (example):
/// ```swift
/// DSPrimaryButton(title: "Next") {
///     // Put here what should happen when the button is tapped
/// }
/// ```
///
/// Notes:
/// - For now, colors are hardcoded.
/// - Later, we will switch to Design System tokens.
@available(iOS 17.0, macOS 13.0, *)
public struct DSPrimaryButton: View {
    private let title: String
    private let action: () -> Void

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color.white)
                .padding(.vertical, 17)
                .padding(.horizontal, 20)
                .frame(width: 173.5, height: 52)
                .contentShape(Rectangle())
        }
        .buttonStyle(PrimaryCapsuleStyle())
        .accessibility(label: Text(title))
    }
}

// MARK: - Button style
/// `ButtonStyle` used with PrimaryCapsuleStyle to give the button its specific style
@available(iOS 17.0, macOS 13.0, *)
private struct PrimaryCapsuleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(backgroundColor(isPressed: configuration.isPressed))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    private func backgroundColor(isPressed: Bool) -> Color {
        let base = Color(red: 0.0588, green: 0.6392, blue: 0.8863)
        let pressed = Color(red: 0.0, green: 0.58, blue: 0.82)
        return isPressed ? pressed : base
    }
}

// MARK: - Preview (development only)
// This lets you see the button in Xcode without running the app.
#if DEBUG
@available(iOS 17.0, macOS 13.0, *)
#Preview("DSPrimaryButton") {
    VStack(spacing: 20) {
        DSPrimaryButton(title: "Book Now") { }
    }
    .padding()
}
#endif

#endif



