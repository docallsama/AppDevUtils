import Foundation

public extension Sequence {
  func filterNil<T>() -> [T] where Element == T? {
    compactMap { $0 }
  }
}
