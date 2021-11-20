//
//  ContentView.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 11/19/21.
//

import SwiftUI

// Main view of the app
struct ContentView: View {
  
  // @State is a special keyword stating that this is a state variable
  // Whenever a state variable changes, SwiftUI will automatically recompute the body
  // Each state variable will always have an initial value
  @State private var alertIsVisible: Bool = false
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
      Button(action: {
        print("Hello")
        self.alertIsVisible = true
      }) {
        Text("Hit Me")
      }
      // isPresented keeps track whether the alert is visible or not
      // There is a '$' before 'alertIsVisible' to convert the state variable into a binding into a state variable
      .alert(isPresented: $alertIsVisible, content: {
        // returns what alert we want to show
        // For dismissButton, it wants us to return an alert button
        return Alert(title: Text("Hello There"), message: Text("This is my first pop-up"), dismissButton: //.default returns an Alert Button
            .default(Text("Awesome")))
      })
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
