import ComposableArchitecture

public extension Array {
  func deduplicatedArray(_ keyPath: KeyPath<Element, some Hashable>) -> Self {
    var set: Set<AnyHashable> = Set()
    return filter { set.insert($0[keyPath: keyPath]).inserted }
  }
}

public extension Array where Element: Identifiable {
  var identifiedArray: IdentifiedArrayOf<Element> {
    IdentifiedArray(uniqueElements: deduplicatedArray(\.id), id: \.id)
  }
}

public extension Array where Element: Identifiable {
  func asIdentifiedDict() -> [Element.ID: Element] {
    reduce(into: [Element.ID: Element]()) { into, element in
      into[element.id] = element
    }
  }
}
