import ComposableArchitecture

// MARK: - Identified

public struct Identified<ID: Hashable, Value>: Identifiable {
  public var id: ID
  public var value: Value

  public init(id: ID, value: Value) {
    self.id = id
    self.value = value
  }
}

// MARK: Equatable

extension Identified: Equatable where Value: Equatable {}

// MARK: Hashable

extension Identified: Hashable where Value: Hashable {}

// MARK: Codable

extension Identified: Codable where ID: Codable, Value: Codable {}

public extension Array {
  func identifiedByIndex() -> IdentifiedArrayOf<Identified<Int, Element>> {
    IdentifiedArray(uniqueElements: enumerated().map(Identified.init(id:value:)))
  }
}

public extension Array where Element: Identifiable {
  func identified() -> IdentifiedArrayOf<Element> {
    var ids = Set<Element.ID>()
    let filtered = filter { ids.insert($0.id).inserted }
    return IdentifiedArray(uniqueElements: filtered)
  }
}
