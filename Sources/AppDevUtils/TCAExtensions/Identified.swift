import ComposableArchitecture

public extension Array {
  func identifiedByIndex() -> IdentifiedArrayOf<Identified<Int, Element>> {
    IdentifiedArray(uniqueElements: enumerated().map { Identified($1, id: $0) })
  }
}

public extension Array where Element: Identifiable {
  func identified() -> IdentifiedArrayOf<Element> {
    var ids = Set<Element.ID>()
    let filtered = filter { ids.insert($0.id).inserted }
    return IdentifiedArray(uniqueElements: filtered)
  }
}
