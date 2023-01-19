
public func log(_ items: Any..., file: StaticString = #filePath, line: UInt = #line, function: StaticString = #function) {
  let joinedItems = items.map(String.init(describing:)).joined(separator: " ")
  print("\(file.lastPathComponent):\(line) \(function): \(joinedItems)")
}

import Foundation

public let log = Logger.self

// MARK: - Logger

public enum Logger {
  public enum Destination {
    case print
    case custom((Message, String) -> Void)
  }

  public enum Settings {
    public static var destinations: [Destination] = [.print]

    // C - colored area start
    // c - colored area end
    // d - date
    // t - time
    // L - level
    // F - file
    // l - line
    // f - function
    // m - message
    public static var format: String = "%C%t %L %F:%l %f %m%c"
    public static var timeFormatter: DateFormatter = .withDateFormat("HH:mm:ss.SSS")
    public static var dateFormatter: DateFormatter = .withDateFormat("yyyy-MM-dd")
    public static var emojisInsteadOfColors: Bool = true
  }

  public struct Message {
    public let value: Any
    public let level: Level
    public let function: StaticString
    public let file: StaticString
    public let line: UInt
    public let column: UInt
    public let date: Date
    public var fileName: String {
      URL(fileURLWithPath: "\(file)").lastPathComponent
    }
  }

  public enum Level: String {
    case verbose = "V"
    case debug = "D"
    case info = "I"
    case warning = "W"
    case error = "E"

    internal var color: Color {
      switch self {
      case .verbose:
        return .blue
      case .debug:
        return .green
      case .info:
        return .cyan
      case .warning:
        return .yellow
      case .error:
        return .red
      }
    }
  }

  internal enum Color: String {
    case red = "\u{001B}[0;31m"
    case green = "\u{001B}[0;32m"
    case yellow = "\u{001B}[0;33m"
    case blue = "\u{001B}[0;34m"
    case magenta = "\u{001B}[0;35m"
    case cyan = "\u{001B}[0;36m"
    case white = "\u{001B}[0;37m"
    case reset = "\u{001B}[0;0m"

    var emoji: String {
      switch self {
      case .red:
        return "❤️"
      case .green:
        return "💚"
      case .yellow:
        return "💛️"
      case .blue:
        return "💙️"
      case .magenta:
        return "💜"
      case .cyan:
        return "🐳️"
      case .white:
        return "🤍"
      case .reset:
        return ""
      }
    }

    var value: String {
      Settings.emojisInsteadOfColors ? emoji : rawValue
    }
  }

  /// Creates message string from Message struct using format defined in Settings.format
  public static func format(_ message: Message, format: String) -> String {
    format
      /// C - colored area start
      .replacingOccurrences(of: "%C", with: message.level.color.value)
      /// c - colored area end
      .replacingOccurrences(of: "%c", with: Color.reset.value)
      /// d - date
      .replacingOccurrences(of: "%d", with: Settings.dateFormatter.string(from: message.date))
      /// t - time
      .replacingOccurrences(of: "%t", with: Settings.timeFormatter.string(from: message.date))
      /// L - level
      .replacingOccurrences(of: "%L", with: message.level.rawValue)
      /// F - file
      .replacingOccurrences(of: "%F", with: message.fileName)
      /// l - line
      .replacingOccurrences(of: "%l", with: "\(message.line)")
      /// f - function
      .replacingOccurrences(of: "%f", with: "\(message.function)")
      /// m - message
      .replacingOccurrences(of: "%m", with: "\(message.value)")
  }

  static func print(
    level: Level,
    _ message: @autoclosure () -> Any,
    _ function: StaticString = #function,
    _ file: StaticString = #file,
    _ line: UInt = #line,
    _ column: UInt = #column,
    _ date: Date = Date()
  ) {
    let message = Message(
      value: message(),
      level: level,
      function: function,
      file: file,
      line: line,
      column: column,
      date: date
    )
    let formatted = Logger.format(message, format: Settings.format)
    for destination in Settings.destinations {
      switch destination {
      case .print:
        Swift.print(formatted)
      case let .custom(closure):
        closure(message, formatted)
      }
    }
  }
}

public extension Logger {
  static func verbose(
    _ items: Any...,
    function: StaticString = #function,
    file: StaticString = #file,
    line: UInt = #line,
    column: UInt = #column
  ) {
    Logger.print(level: .verbose, message(from: items), function, file, line, column)
  }

  static func debug(
    _ items: Any...,
    function: StaticString = #function,
    file: StaticString = #file,
    line: UInt = #line,
    column: UInt = #column
  ) {
    Logger.print(level: .debug, message(from: items), function, file, line, column)
  }

  static func info(
    _ items: Any...,
    function: StaticString = #function,
    file: StaticString = #file,
    line: UInt = #line,
    column: UInt = #column
  ) {
    Logger.print(level: .info, message(from: items), function, file, line, column)
  }

  static func warning(
    _ items: Any...,
    function: StaticString = #function,
    file: StaticString = #file,
    line: UInt = #line,
    column: UInt = #column
  ) {
    Logger.print(level: .warning, message(from: items), function, file, line, column)
  }

  static func error(
    _ items: Any...,
    function: StaticString = #function,
    file: StaticString = #file,
    line: UInt = #line,
    column: UInt = #column
  ) {
    Logger.print(level: .error, message(from: items), function, file, line, column)
  }

  private static func message(from items: [Any]) -> Any {
    guard items.count > 1 else {
      return items.first ?? items
    }

    return items.map { "\($0)" }.joined(separator: " ")
  }
}
