import Foundation

public extension Double {
  private static let decimalFormatter = NumberFormatter().then {
    $0.numberStyle = .decimal
    $0.maximumFractionDigits = 3
  }

  func prettyString(maxFraction: Int = 3) -> String {
    Double.decimalFormatter
      .then { $0.maximumFractionDigits = maxFraction }
      // swiftlint:disable:next legacy_objc_type
      .string(from: NSNumber(value: self)) ?? String(format: "%.\(maxFraction)f", self)
  }

  var dateMillisecondsSince1970: Date {
    Date(timeIntervalSince1970: self / 1000)
  }
}

public extension Double {
  func roundToDecimal(_ fractionDigits: Int) -> Double {
    let multiplier = pow(10, Double(fractionDigits))
    return Darwin.round(self * multiplier) / multiplier
  }
}
