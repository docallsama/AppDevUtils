import AppDevUtils
import PlaygroundSupport
import SwiftUI
import UIKit

let fonts: [(String, Font)] = [
  ("titleXL", .DS.titleXL),
  ("titleL", .DS.titleL),
  ("titleM", .DS.titleM),
  ("titleS", .DS.titleS),
  ("headlineL", .DS.headlineL),
  ("headlineM", .DS.headlineM),
  ("headlineS", .DS.headlineS),
  ("bodyL", .DS.bodyL),
  ("bodyM", .DS.bodyM),
  ("bodyS", .DS.bodyS),
  ("footnote", .DS.footnote),
  ("date", .DS.date),
  ("captionM", .DS.captionM),
  ("captionS", .DS.captionS),
]

// MARK: - ContentView

struct ContentView: View {
  var body: some View {
    VStack {
      ForEachWithIndex(fonts) { _, font in
        Text(font.0).font(font.1)
      }
    }
    .frame(width: 350, height: 750)
  }
}

PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
