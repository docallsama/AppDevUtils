import CoreGraphics
import Foundation

extension CGPoint: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(x)
    hasher.combine(y)
  }

  public static func == (lhs: CGPoint, rhs: CGPoint) -> Bool {
    if lhs.x != rhs.x {
      return false
    }
    if lhs.y != rhs.y {
      return false
    }
    return true
  }
}
