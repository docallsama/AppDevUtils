import ComposableArchitecture

public extension AnyReducer {
  static func subscriptions(
    _ subscriptions: @escaping (State, Environment) -> [AnyHashable: EffectTask<Action>]
  ) -> Self {
    var activeSubscriptions: [AnyHashable: EffectTask<Action>] = [:]

    return AnyReducer { state, _, environment in
      let currentSubscriptions = subscriptions(state, environment)
      defer { activeSubscriptions = currentSubscriptions }
      return .merge(
        Set(activeSubscriptions.keys).union(currentSubscriptions.keys).map { id in
          switch (activeSubscriptions[id], currentSubscriptions[id]) {
          case (.some, .none):
            return .cancel(id: id)
          case let (.none, .some(effect)):
            return effect.cancellable(id: id)
          default:
            return .none
          }
        }
      )
    }
  }
}
