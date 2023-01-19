import SwiftUI

// MARK: - LocalePreview

public struct LocalePreview<Preview: View>: View {
  private let preview: Preview

  public var body: some View {
    ForEach(Locale.all, id: \.self) { locale in
      self.preview
        .previewLayout(PreviewLayout.sizeThatFits)
        .environment(\.locale, locale)
        .previewDisplayName("Locale: \(locale.identifier)")
    }
  }

  public init(@ViewBuilder builder: @escaping () -> Preview) {
    preview = builder()
  }
}

// From https://www.avanderlee.com/swiftui/previews-different-states/
public extension Locale {
  static let all = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
}
