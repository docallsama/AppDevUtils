import SwiftUI

public struct FontPreview<Preview: View>: View {
  private let preview: Preview
  private let font: Font

  public var body: some View {
    preview
      .previewLayout(PreviewLayout.sizeThatFits)
      .environment(\.font, font)
      .previewDisplayName("Font")
  }

  public init(_ font: Font, @ViewBuilder builder: @escaping () -> Preview) {
    self.font = font
    preview = builder()
  }
}
