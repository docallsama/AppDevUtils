public extension Dictionary {
  @inlinable
  mutating func mergeWithOverwrite(_ other: [Key: Value]) {
    merge(other, uniquingKeysWith: { _, new in new })
  }

  @inlinable
  mutating func mergeOnlyMissing(_ other: [Key: Value]) {
    merge(other, uniquingKeysWith: { old, _ in old })
  }

  @inlinable
  func mergingWithOverwrite(_ other: [Key: Value]) -> [Key: Value] {
    merging(other, uniquingKeysWith: { _, new in new })
  }

  @inlinable
  func mergingOnlyMissing(_ other: [Key: Value]) -> [Key: Value] {
    merging(other, uniquingKeysWith: { old, _ in old })
  }
}
