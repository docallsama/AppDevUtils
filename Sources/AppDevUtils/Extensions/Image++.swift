import SwiftUI

#if canImport(UIKit)
  public extension Image {
    init(contentOfFile file: String) {
      if let image = UIImage(contentsOfFile: file) {
        self = Image(uiImage: image)
      } else {
        self = Image(systemName: "exclamationmark.triangle.fill")
          .symbolRenderingMode(.multicolor)
      }
    }
  }
#endif
