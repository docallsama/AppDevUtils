import DynamicColor
import SwiftUI

// MARK: - Color.Palette

public extension Color.DS {
  enum Background {
    #if os(iOS) || os(tvOS) || os(watchOS)
      public static var primary = Color(DynamicColor.systemBackground)
      public static var secondary = Color(DynamicColor.secondarySystemBackground)
      public static var tertiary = Color(DynamicColor.tertiarySystemBackground)
    #elseif os(macOS)
      public static var primary = Color(DynamicColor.windowBackgroundColor)
      public static var secondary = primary.lighten(by: 0.1)
      public static var tertiary = primary.darken(by: 0.1)
    #endif
    public static var accent = Color.accentColor
    public static var accentAlt = Color(DynamicColor(accent).complemented())
    public static var error = Color(DynamicColor.systemRed)
    public static var success = Color(DynamicColor.systemGreen)
    public static var warning = Color(DynamicColor.systemOrange)
    public static var link = Color(DynamicColor.systemBlue)
  }

  enum Text {
    public static var base = Color(DynamicColor.label)
    public static var subdued = Color(DynamicColor.secondaryLabel)
    public static var accent = Color.accentColor
    public static var accentAlt = Color(DynamicColor(accent).complemented())
    public static var error = Color(DynamicColor.systemRed)
    public static var success = Color(DynamicColor.systemGreen)
    public static var warning = Color(DynamicColor.systemOrange)
    public static var link = Color(DynamicColor.systemBlue)
  }

  enum Stroke {
    public static var base = Background.primary.lighten(by: 0.1)
    public static var subdued = Background.tertiary.lighten(by: 0.05)
    public static var accent = Background.accent.lighten(by: 0.1)
  }

  enum Shadow {
    public static var primary = Background.primary.darken(by: 0.2).opacity(0.6)
    public static var secondary = Background.primary.darken(by: 0.2).opacity(0.2)
  }
}
