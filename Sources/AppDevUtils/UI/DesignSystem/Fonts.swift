import SwiftUI

// MARK: - Font.DS

public extension Font.DS {
  static var titleXL = Font.system(.largeTitle, design: .rounded).weight(.regular)
  static var titleL = Font.system(.title, design: .rounded).weight(.regular)
  static var titleM = Font.system(.title2, design: .rounded).weight(.regular)
  static var titleS = Font.system(.title3, design: .rounded).weight(.regular)
  static var headlineL = Font.system(.title3, design: .rounded).weight(.semibold)
  static var headlineM = Font.system(.headline, design: .rounded).weight(.semibold)
  static var headlineS = Font.system(.callout, design: .rounded).weight(.semibold)
  static var bodyL = Font.system(.title3, design: .rounded).weight(.regular)
  static var bodyM = Font.system(.body, design: .rounded).weight(.regular)
  static var bodyS = Font.system(.callout, design: .rounded).weight(.regular)
  static var footnote = Font.system(.footnote, design: .rounded).weight(.light)
  static var date = Font.system(.footnote, design: .monospaced).weight(.regular)
  static var captionM = Font.system(.caption, design: .rounded).weight(.regular)
  static var captionS = Font.system(.caption2, design: .rounded).weight(.regular)
}

// MARK: - UIFont.DS

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit

  public extension UIFont.DS {
    static var titleXL = UIFont.preferredFont(forTextStyle: .largeTitle).with(design: .rounded, weight: .regular)
    static var titleL = UIFont.preferredFont(forTextStyle: .title1).with(design: .rounded, weight: .regular)
    static var titleM = UIFont.preferredFont(forTextStyle: .title2).with(design: .rounded, weight: .regular)
    static var titleS = UIFont.preferredFont(forTextStyle: .title3).with(design: .rounded, weight: .regular)
    static var headlineL = UIFont.preferredFont(forTextStyle: .title3).with(design: .rounded, weight: .semibold)
    static var headlineM = UIFont.preferredFont(forTextStyle: .headline).with(design: .rounded, weight: .semibold)
    static var headlineS = UIFont.preferredFont(forTextStyle: .callout).with(design: .rounded, weight: .semibold)
    static var bodyL = UIFont.preferredFont(forTextStyle: .title3).with(design: .rounded, weight: .regular)
    static var bodyM = UIFont.preferredFont(forTextStyle: .body).with(design: .rounded, weight: .regular)
    static var bodyS = UIFont.preferredFont(forTextStyle: .callout).with(design: .rounded, weight: .regular)
    static var footnote = UIFont.preferredFont(forTextStyle: .footnote).with(design: .rounded, weight: .light)
    static var date = UIFont.preferredFont(forTextStyle: .footnote).with(design: .monospaced, weight: .regular)
    static var captionM = UIFont.preferredFont(forTextStyle: .caption1).with(design: .rounded, weight: .regular)
    static var captionS = UIFont.preferredFont(forTextStyle: .caption2).with(design: .rounded, weight: .regular)
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
