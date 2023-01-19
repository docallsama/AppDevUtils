import ComposableArchitecture

public extension AnyReducer {
  static func withContext<S, C>(_ reducer: @escaping (inout S, C, Action, Environment) -> Effect<Action, Never>) -> Self
    where State == StateWithContext<S, C> {
    AnyReducer { state, action, environment in
      reducer(&state.state, state.context, action, environment)
    }
  }
}

// MARK: - StateWithContext

public struct StateWithContext<State, Context> {
  public var state: State
  public let context: Context

  public init(state: State, context: Context) {
    self.state = state
    self.context = context
  }

  public init(_ state: State, _ context: Context) {
    self.state = state
    self.context = context
  }
}

public extension StateWithContext {
  var localState: State {
    get { state }
    set { state = newValue }
  }
}

public func withContext<Whole, A, B>(_ a: @escaping (Whole) -> A, _ b: @escaping (Whole) -> B) -> (Whole) -> StateWithContext<A, B> {
  { StateWithContext(state: a($0), context: b($0)) }
}

// MARK: Hashable

extension StateWithContext: Hashable where State: Hashable, Context: Hashable {}

// MARK: Equatable

extension StateWithContext: Equatable where State: Equatable, Context: Equatable {}
