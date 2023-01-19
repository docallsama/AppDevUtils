import IdentifiedCollections

// MARK: - Occupiable

// https://github.com/artsy/Emergence/blob/master/Emergence/Extensions/Apple/Occupyable%2BisNotEmpty.swift

// Anything that can hold a value (strings, arrays, etc)
public protocol Occupiable {
  var isEmpty: Bool { get }
  var isNotEmpty: Bool { get }
}

// Give a default implementation of isNotEmpty, so conformance only requires one implementation
public extension Occupiable {
  var isNotEmpty: Bool {
    !isEmpty
  }
}

// MARK: - String + Occupiable

extension String: Occupiable {}

// MARK: - Array + Occupiable

extension Array: Occupiable {}

// MARK: - Dictionary + Occupiable

extension Dictionary: Occupiable {}

// MARK: - Set + Occupiable

extension Set: Occupiable {}

// MARK: - IdentifiedArray + Occupiable

extension IdentifiedArray: Occupiable {}

// Extend the idea of occupiability to optionals. Specifically, optionals wrapping occupiable things.
public extension Optional where Wrapped: Occupiable {
  var isNilOrEmpty: Bool {
    switch self {
    case .none:
      return true

    case let .some(value):
      return value.isEmpty
    }
  }

  var isNotNilNotEmpty: Bool {
    !isNilOrEmpty
  }
}
