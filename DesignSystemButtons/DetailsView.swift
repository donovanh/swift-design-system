//
//  DetailsView.swift
//  DesignSystemButtons
//
//  Created by Donovan Hutchinson on 09/10/2023.
//

import SwiftUI

struct Detail<Title: View, Subtitle: View, Caption: View>: View {

  @Environment(\.detailStyle) private var style
  private let title: Title
  private let subtitle: Subtitle
  private let caption: Caption

  init (
    @ViewBuilder title: () -> Title,
    @ViewBuilder subtitle: () -> Subtitle,
    @ViewBuilder caption: () -> Caption
  ) {
    self.title = title()
    self.subtitle = subtitle()
    self.caption = caption()
  }

  var body: some View {
    let configuration = DetailStyleConfiguration(
      title: title,
      subtitle: subtitle,
      caption: caption)
      AnyView(style.resolve(configuration: configuration))
  }
}

// Default style
struct PlainDetailStyle: DetailStyle {

  func makeBody(configuration: Configuration) -> some View {
    VStack {
      configuration.title
        .font(.system(size: 32, weight: .bold))
      configuration.subtitle
        .font(.system(size: 24))
      configuration.caption
        .font(.system(size: 14, weight: .light))
    }
  }
}

// Primary style

struct PrimaryButtonDetailStyle: DetailStyle {

  func makeBody(configuration: Configuration) -> some View {

    VStack(alignment: .leading) {
      configuration.title
        .font(.system(size: 32, weight: .bold))
      configuration.subtitle
        .font(.system(size: 24))
      configuration.caption
        .font(.system(size: 14, weight: .light))
    }
  }
}

// Configuration

struct DetailStyleConfiguration {

  struct Title: View {
    let body: AnyView
  }

  struct Subtitle: View {
    let body: AnyView
  }

  struct Caption: View {
    let body: AnyView
  }

  let title: Title
  let subtitle: Subtitle
  let caption: Caption

  fileprivate init(title: some View, subtitle: some View, caption: some View) {
    self.title = Title(body: AnyView(title))
    self.subtitle = Subtitle(body: AnyView(subtitle))
    self.caption = Caption(body: AnyView(caption))
  }
}

// Environment

struct DetailStyleKey: EnvironmentKey {
  static var defaultValue: any DetailStyle = PlainDetailStyle()
}

extension EnvironmentValues {

  fileprivate var detailStyle : any DetailStyle {
    get { self[DetailStyleKey.self] }
    set { self[DetailStyleKey.self] = newValue }
  }

}

extension View {

  func detailStyle(_ style: some DetailStyle) -> some View {
    environment(\.detailStyle, style)
  }

}

// ResolvedDetailStyle

protocol DetailStyle: DynamicProperty {

  typealias Configuration = DetailStyleConfiguration
  associatedtype Body: View

  @ViewBuilder func makeBody(configuration: Configuration) -> Body
}

extension DetailStyle {
  fileprivate func resolve(configuration: Configuration) -> some View {
    ResolvedDetailStyle(style: self, configuration: configuration)
  }
}

private struct ResolvedDetailStyle<Style: DetailStyle>: View {
  let style: Style
  let configuration: Style.Configuration

  var body: some View {
    style.makeBody(configuration: configuration)
  }
}
