import SwiftUI

public struct DarkThemePreview<Preview: View>: View {
  private let preview: Preview

  public var body: some View {
    preview
      .previewLayout(PreviewLayout.sizeThatFits)
      .background(Color.black)
      .environment(\.colorScheme, .dark)
      .previewDisplayName("Dark Theme")
  }

  public init(@ViewBuilder builder: @escaping () -> Preview) {
    preview = builder()
  }
}
