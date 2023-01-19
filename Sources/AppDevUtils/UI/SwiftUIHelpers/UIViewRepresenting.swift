#if canImport(UIKit)
  import SwiftUI
  import UIKit

  public struct UIViewRepresenting<View: UIView>: UIViewRepresentable {
    public let view: View
    public let updateUIView: (View, Context) -> Void

    public init(view: View, updateUIView: @escaping (View, Context) -> Void) {
      self.view = view
      self.updateUIView = updateUIView
    }

    public func makeUIView(context _: Context) -> View {
      view
    }

    public func updateUIView(_ uiView: View, context: Context) {
      updateUIView(uiView, context)
    }
  }
#endif
