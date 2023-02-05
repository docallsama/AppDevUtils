import SwiftUI

// MARK: - Color.DS

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit

  public typealias AppColor = UIColor
  public typealias AppFont = UIFont
#elseif os(macOS)
  import AppKit

  public typealias AppColor = NSColor
  public typealias AppFont = NSFont
#endif

// MARK: - Color.DS

public extension Color {
  enum DS {}
}

// MARK: - AppColor.DS

public extension AppColor {
  enum DS {}
}

// MARK: - Font.DS

public extension Font {
  enum DS {}
}

// MARK: - AppFont.DS

public extension AppFont {
  enum DS {}
}
