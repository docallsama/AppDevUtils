import CoreGraphics
import Foundation

public extension CGSize {
  var ceil: CGSize {
    with {
      $0.width = Foundation.ceil($0.width)
      $0.height = Foundation.ceil($0.height)
    }
  }
}

// MARK: - CGSize + Hashable

extension CGSize: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(width)
    hasher.combine(height)
  }

  public static func == (lhs: CGSize, rhs: CGSize) -> Bool {
    if lhs.width != rhs.width {
      return false
    }
    if lhs.height != rhs.height {
      return false
    }
    return true
  }
}
