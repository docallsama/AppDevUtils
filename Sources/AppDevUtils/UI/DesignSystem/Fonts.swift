import SwiftUI

// MARK: - Font.DS

public extension Font {
  @available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 8.0, *)
  enum DS {
    public static var titleXL = Font.system(.largeTitle, design: .rounded, weight: .regular)
    public static var titleL = Font.system(.title, design: .rounded, weight: .regular)
    public static var titleM = Font.system(.title2, design: .rounded, weight: .regular)
    public static var titleS = Font.system(.title3, design: .rounded, weight: .medium)
    public static var bodyL = Font.system(.title3, design: .rounded, weight: .regular)
    public static var bodyM = Font.system(.body, design: .rounded, weight: .regular)
    public static var bodyS = Font.system(.callout, design: .rounded, weight: .regular)
    public static var footnote = Font.system(.footnote, design: .rounded, weight: .light)
    public static var date = Font.system(.footnote, design: .monospaced, weight: .regular)
  }
}

// MARK: - UIFont.DS

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit

  public extension UIFont {
    enum DS {
      public static var titleXL = UIFont.preferredFont(forTextStyle: .largeTitle).with(design: .rounded, weight: .regular)
      public static var titleL = UIFont.preferredFont(forTextStyle: .title1).with(design: .rounded, weight: .regular)
      public static var titleM = UIFont.preferredFont(forTextStyle: .title2).with(design: .rounded, weight: .regular)
      public static var titleS = UIFont.preferredFont(forTextStyle: .title3).with(design: .rounded, weight: .medium)
      public static var bodyL = UIFont.preferredFont(forTextStyle: .title3).with(design: .rounded, weight: .regular)
      public static var bodyM = UIFont.preferredFont(forTextStyle: .body).with(design: .rounded, weight: .regular)
      public static var bodyS = UIFont.preferredFont(forTextStyle: .callout).with(design: .rounded, weight: .regular)
      public static var footnote = UIFont.preferredFont(forTextStyle: .footnote).with(design: .rounded, weight: .light)
      public static var date = UIFont.preferredFont(forTextStyle: .footnote).with(design: .monospaced, weight: .regular)
    }
  }

  extension UIFont {
    func with(design: UIFontDescriptor.SystemDesign, weight: UIFont.Weight) -> UIFont {
      var newDescriptor = fontDescriptor
        .addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: weight]])
      newDescriptor = newDescriptor.withDesign(design) ?? newDescriptor
      return UIFont(descriptor: newDescriptor, size: pointSize)
    }
  }
#endif
