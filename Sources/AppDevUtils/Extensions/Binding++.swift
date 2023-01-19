import SwiftUI

public extension Binding {
  func mirror(to other: Binding) -> Self {
    .init(
      get: { wrappedValue },
      set: {
        wrappedValue = $0
        other.wrappedValue = $0
      }
    )
  }
}

public extension Binding {
  func onSet(_ body: @escaping (Value) -> Void) -> Self {
    .init(
      get: { wrappedValue },
      set: { wrappedValue = $0; body($0) }
    )
  }

  func printOnSet() -> Self {
    onSet {
      print("Set value: \($0)")
    }
  }
}

public extension Binding {
  func onChange(perform action: @escaping (Value) -> Void) -> Self where Value: Equatable {
    .init(
      get: { wrappedValue },
      set: { newValue in
        let oldValue = wrappedValue

        wrappedValue = newValue

        if newValue != oldValue {
          action(newValue)
        }
      }
    )
  }

  func onChange(toggle value: Binding<Bool>) -> Self where Value: Equatable {
    onChange { _ in
      value.wrappedValue.toggle()
    }
  }
}

public extension Binding where Value: Equatable {
  // NB: Custom bindings can over-emit in certain situations, like sheet dismissal.
  //     This helper can be used to avoid those over-emissions.
  //     https://gist.github.com/stephencelis/09695c901d3ec9f443069ea8c41c4716
  func removeDuplicates(by predicate: @escaping (Value, Value) -> Bool) -> Self {
    Binding(
      get: { wrappedValue },
      set: {
        if !predicate(wrappedValue, $0) {
          wrappedValue = $0
        }
      }
    )
  }
}

public extension Binding where Value: Equatable {
  func removeDuplicates() -> Self {
    removeDuplicates(by: ==)
  }
}
