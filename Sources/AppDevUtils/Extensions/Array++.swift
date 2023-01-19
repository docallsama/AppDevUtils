import ComposableArchitecture

public extension Array {
  func deduplicatedArray(_ keyPath: KeyPath<Element, some Hashable>) -> Self {
    let set = Set(map { $0[keyPath: keyPath] })
    return filter { set.contains($0[keyPath: keyPath]) }
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
