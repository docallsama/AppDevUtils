import Foundation

public func create<T: AnyObject>(_ object: T, configure: (T) -> Void) -> T {
  configure(object)
  return object
}

public func create<T: NSObject>(configure: (T) -> Void) -> T {
  let object = T()
  configure(object)
  return object
}
