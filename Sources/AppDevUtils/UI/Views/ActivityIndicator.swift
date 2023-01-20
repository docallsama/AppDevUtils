import SwiftUI

// MARK: - ActivityIndicator

public struct ActivityIndicator: View {
  public init() {}

  public var body: some View {
    DefaultIndicatorView(count: 8)
  }
}

// MARK: - DefaultIndicatorView

public struct DefaultIndicatorView: View {
  let count: Int

  public init(count: Int) {
    self.count = count
  }

  public var body: some View {
    GeometryReader { geometry in
      ForEach(0 ..< count, id: \.self) { index in
        DefaultIndicatorItemView(index: index, count: count, size: geometry.size)
      }
      .frame(width: geometry.size.width, height: geometry.size.height)
    }
  }
}

// MARK: - DefaultIndicatorItemView

public struct DefaultIndicatorItemView: View {
  let index: Int
  let count: Int
  let size: CGSize

  @State private var opacity: Double = 0

  public init(index: Int, count: Int, size: CGSize) {
    self.index = index
    self.count = count
    self.size = size
  }

  public var body: some View {
    let height = size.height / 3.2
    let width = height / 2
    let angle = 2 * .pi / CGFloat(count) * CGFloat(index)
    let x = (size.width / 2 - height / 2) * cos(angle)
    let y = (size.height / 2 - height / 2) * sin(angle)

    let animation = Animation.default
      .repeatForever(autoreverses: true)
      .delay(Double(index) / Double(count) / 2)

    return RoundedRectangle(cornerRadius: width / 2 + 1)
      .frame(width: width, height: height)
      .rotationEffect(Angle(radians: Double(angle + CGFloat.pi / 2)))
      .offset(x: x, y: y)
      .opacity(opacity)
      .onAppear {
        opacity = 1
        withAnimation(animation) {
          opacity = 0.3
        }
      }
  }
}
