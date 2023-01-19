public func resulting<T>(_ closure: () throws -> T) -> Result<T, Error> {
  do {
    return .success(try closure())
  } catch {
    return .failure(error)
  }
}

public extension Result where Success == String, Failure: Error {
  var stringify: String {
    switch self {
    case let .success(value):
      return value
    case let .failure(error):
      return "Error: " + error.localizedDescription
    }
  }
}
