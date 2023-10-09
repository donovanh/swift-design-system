//
//  ContentView.swift
//  DesignSystemButtons
//
//  Created by Donovan Hutchinson on 09/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        // Simple Button
        Button("Title") {
            
        }
        .buttonStyle(.primary)
        
        // Button with image
        Button {
            
        } label: {
            Image(systemName: "square.and.arrow.up")
        }
        .buttonStyle(.primary)
        
        // Button with text and image
        Button {
            
        } label: {
            Label {
              Text("Text")
            } icon: {
              Image(systemName: "square.and.arrow.up")
            }
        }
        .buttonStyle(.primary)
        
        // Button with title and subtitle
        Button(
            title: "Title",
            subtitle: "Subtitle",
            action: {}
        )
        .buttonStyle(.primary)
        
        // Button with title and subtitle and caption
        Button (
          title: "Title",
          subtitle: "Subtitle",
          caption: "Caption",
          action: {
          }
        )
        .buttonStyle(.primary)
        
        // Button with title and subtitle and caption and image
        Button (
          title: "Title",
          subtitle: "Subtitle",
          caption: "Caption",
          systemImage: "square.and.arrow.up",
          action: {
          }
        )
        .buttonStyle(.primary)
    }
    
    func buttonAction() {
       print("ok")
    }
}

#Preview {
    ContentView()
}
