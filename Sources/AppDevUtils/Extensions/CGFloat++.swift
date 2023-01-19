import CoreGraphics
import Foundation

public extension CGFloat {
  /// SwifterSwift: Absolute of CGFloat value.
  var abs: CGFloat {
    Swift.abs(self)
  }

  /// SwifterSwift: Ceil of CGFloat value.
  var ceil: CGFloat {
    Foundation.ceil(self)
  }

  func prettyString(maxFraction: Int = 3) -> String {
    Double(self).prettyString(maxFraction: maxFraction)
  }
}
