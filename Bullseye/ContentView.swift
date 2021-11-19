//
//  ContentView.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 11/19/21.
//

import SwiftUI

// Main view of the app
struct ContentView: View {
  var body: some View {
    VStack {
      Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO ")
        .bold()
        .kerning(2.0)
        .multilineTextAlignment(.center)
        .lineSpacing(4)
        .font(.footnote)
      
      Text("89")
        .font(.largeTitle)
        .kerning(-1.0)
        .fontWeight(.black)
      HStack {
        Text("1")
          .bold()
        Slider(value: .constant(50.0), in: 1.0...100.0)
        Text("100")
          .bold()
      }
      Button(action: {}) {
        Text("Hit Me")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
