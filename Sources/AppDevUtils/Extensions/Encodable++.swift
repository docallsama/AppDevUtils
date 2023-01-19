import Foundation

public extension Encodable {
  func getJSONString(_ encoder: JSONEncoder = JSONEncoder()) throws -> String {
    encoder.outputFormatting = [.prettyPrinted]
    return try String(data: encoder.encode(self), encoding: .utf8).require()
  }
}
