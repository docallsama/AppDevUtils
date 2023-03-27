#if canImport(UIKit)
  import SwiftUI
  import UIKit

  // MARK: - ShareSheet

  public struct ShareSheet: UIViewControllerRepresentable {
    public typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void

    public let activityItems: [Any]
    public let applicationActivities: [UIActivity]?
    public let excludedActivityTypes: [UIActivity.ActivityType]?
    public let callback: Callback?

    public func makeUIViewController(context _: Context) -> UIActivityViewController {
      let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
      controller.excludedActivityTypes = excludedActivityTypes
      controller.completionWithItemsHandler = callback
      return controller
    }

    public func updateUIViewController(_: UIActivityViewController, context _: Context) {
      // nothing to do here
    }

    public init(activityItems: [Any],
                applicationActivities: [UIActivity]? = nil,
                excludedActivityTypes: [UIActivity.ActivityType]? = nil,
                callback: ((_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void)? = nil) {
      self.activityItems = activityItems
      self.applicationActivities = applicationActivities
      self.excludedActivityTypes = excludedActivityTypes
      self.callback = callback
    }
  }

  public extension View {
    func shareSheet(items: Binding<[some Any]?>) -> some View {
      sheet(isPresented: Binding(get: { items.wrappedValue != nil }, set: { if !$0 { items.wrappedValue = nil } })) {
        ShareSheet(activityItems: items.wrappedValue ?? [])
      }
    }

    func shareSheet(item: Binding<(some Any)?>) -> some View {
      sheet(isPresented: Binding(get: { item.wrappedValue != nil }, set: { if !$0 { item.wrappedValue = nil } })) {
        ShareSheet(activityItems: item.wrappedValue.map { [$0] } ?? [])
      }
    }
  }
#endif
