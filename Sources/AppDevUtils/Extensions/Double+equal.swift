import Foundation

public extension Double {
  static func equal(_ lhs: Double, _ rhs: Double, precise value: Int? = nil) -> Bool {
    lhs.isEqual(to: rhs, precise: value)
  }

  func isEqual(to rhs: Double, precise value: Int? = nil) -> Bool {
    guard let value else {
      return self == rhs
    }

    return precised(value) == rhs.precised(value)
  }

  func precised(_ value: Int = 1) -> Double {
    let offset = pow(10, Double(value))
    return (self * offset).rounded() / offset
  }
}
