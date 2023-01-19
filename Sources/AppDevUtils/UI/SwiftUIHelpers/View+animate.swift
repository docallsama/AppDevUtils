import SwiftUI

// Create an immediate animation.
public extension View {
  func animate(using animation: Animation = .easeInOut(duration: 0.3), _ action: @escaping () -> Void) -> some View {
    onAppear {
      withAnimation(animation) {
        action()
      }
    }
  }
}

// Create an immediate, looping animation
public extension View {
  func animateForever(using animation: Animation = .easeInOut(duration: 0.3), autoreverses: Bool = false,
                      _ action: @escaping () -> Void) -> some View {
    let repeated = animation.repeatForever(autoreverses: autoreverses)

    return onAppear {
      withAnimation(repeated) {
        action()
      }
    }
  }
}
