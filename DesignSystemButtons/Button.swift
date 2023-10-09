//
//  ButtonStyle.swift
//  DesignSystemButtons
//
//  Created by Donovan Hutchinson on 09/10/2023.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {

  func makeBody(configuration: Configuration) -> some View {

    configuration.label
      .font(.title)
      .padding(16)
      .background(.blue, in: RoundedRectangle(cornerRadius: 16))
      .foregroundColor(.white)
      .labelStyle(PrimaryButtonLabelStyle())
      .detailStyle(PrimaryButtonDetailStyle())
  }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
  static var primary: Self { Self() }
}

// Label Button style

struct PrimaryButtonLabelStyle: LabelStyle {

  func makeBody(configuration: Configuration) -> some View {

    HStack(spacing: 100) {
      configuration.icon
      configuration.title
    }
  }
}

// Button extensions

// Detail usage

extension Button where Label == Detail<Text, Text, Text> {
    init(
        title: LocalizedStringKey,
        subtitle: LocalizedStringKey,
        caption: LocalizedStringKey,
        action: @escaping () -> Void
    ) {
        self.init(action: action) {
          Detail {
              Text("Title")
          } subtitle: {
              Text("Subtitle")
          } caption: {
              Text("Caption")
          }
        }
    }
}

// Detail and systemImage / icon

extension Button where Label == SwiftUI.Label<Detail<Text, Text, Text>, Image> {
    init(
        title: LocalizedStringKey,
        subtitle: LocalizedStringKey,
        caption: LocalizedStringKey,
        systemImage: String,
        action: @escaping () -> Void
    ) {
        self.init(action: action) {
            Label {
                Detail {
                  Text ("Title")
                } subtitle: {
                  Text ("Subtitle")
                } caption: {
                  Text("Caption" )
                }
            } icon: {
                Image(systemName: systemImage)
            }
        }
    }
}

// Caption optional

extension Button where Label == Detail<Text, Text, EmptyView> {
    init(
        title: LocalizedStringKey,
        subtitle: LocalizedStringKey,
        action: @escaping () -> Void
    ) {
        self.init(action: action) {
          Detail {
              Text("Title")
          } subtitle: {
              Text("Subtitle")
          } caption: {
              EmptyView()
          }
        }
    }
}
