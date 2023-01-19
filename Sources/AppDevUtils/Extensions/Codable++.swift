import Foundation

public extension Decodable {
  static func fromFile(path: String, decoder: JSONDecoder = JSONDecoder()) -> Self? {
    do {
      let data = try Data(contentsOf: URL(fileURLWithPath: path))
      return try decoder.decode(Self.self, from: data)
    } catch {
      log(error)
      return nil
    }
  }
}

public extension Encodable {
  func saveToFile(path: String, encoder: JSONEncoder = JSONEncoder()) throws {
    let data = try encoder.encode(self)
    try data.write(to: URL(fileURLWithPath: path), options: .atomic)
  }
}

public extension Encodable {
  var prettyJSONString: String {
    resulting {
      try JSONEncoder()
        .with { $0.outputFormatting = [.withoutEscapingSlashes, .prettyPrinted] }
        .encode(self)
        .utf8String
    }
    .stringify
  }
}

public extension Data {
  var utf8String: String {
    String(data: self, encoding: .utf8) ?? "Error: Can't decode data"
  }
}
