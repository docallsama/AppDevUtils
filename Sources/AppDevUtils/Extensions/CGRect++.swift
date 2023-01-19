import CoreGraphics
import Foundation

public extension CGRect {
  var ceil: CGRect {
    with {
      $0.origin.x = Foundation.ceil($0.origin.x)
      $0.origin.y = Foundation.ceil($0.origin.y)
      $0.size.width = Foundation.ceil($0.size.width)
      $0.size.height = Foundation.ceil($0.size.height)
    }
  }

  var prettyString: String {
    "(\(origin.x.prettyString(maxFraction: 2)), \(origin.y.prettyString(maxFraction: 2)), \(size.width.prettyString(maxFraction: 2)), \(size.height.prettyString(maxFraction: 2)))"
  }
}

// MARK: - CGRect + Hashable

extension CGRect: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(origin)
    hasher.combine(size)
  }

  public static func == (lhs: CGRect, rhs: CGRect) -> Bool {
    if lhs.origin != rhs.origin {
      return false
    }
    if lhs.size != rhs.size {
      return false
    }
    return true
  }
}
