import SwiftUI

public struct RightToLeftPreview<Preview: View>: View {
  private let preview: Preview

  public var body: some View {
    preview
      .previewLayout(PreviewLayout.sizeThatFits)
      .environment(\.layoutDirection, .rightToLeft)
      .previewDisplayName("Right to Left")
  }

  public init(@ViewBuilder builder: @escaping () -> Preview) {
    preview = builder()
  }
}
