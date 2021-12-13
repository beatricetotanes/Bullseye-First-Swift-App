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
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  // tells what ContentView() should display on the screen
  // "some" in "some View" broadens the possibilities for the body; the body can contain a view or something that behaves like a view
  // It can mean that it can be an instance that isn't exactly like a view but it has the same properties and methods as View.
  var body: some View {
    VStack {
      Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO ")
        .bold()
        .kerning(2.0)
        .multilineTextAlignment(.center)
        .lineSpacing(4)
        .font(.footnote)
      
      Text(String(game.target))
        .font(.largeTitle)
        .kerning(-1.0)
        .fontWeight(.black)
      HStack {
        Text("1")
          .bold()
        Slider(value: $sliderValue, in: 1.0...100.0)
        Text("100")
          .bold()
      }
      Button(action: {
        print("Hello")
        alertIsVisible = true
      }) {
        Text("Hit Me")
      }
      // isPresented keeps track whether the alert is visible or not
      // There is a '$' before 'alertIsVisible' to convert the state variable into a binding
      .alert(isPresented: $alertIsVisible, content: {
        let roundedValue = Int(sliderValue.rounded())
        // returns what alert we want to show;
        // For dismissButton, it wants us to return an alert button
        return Alert(title: Text("Hello There"), message: Text("The slider's value is \(roundedValue). \n" + "You scored \(game.points(sliderValue: roundedValue)) points this round"), dismissButton: //.default returns an Alert Button
            .default(Text("Awesome")))
      })
    }
  }
}

// Controls the preview on the righthand side
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView() // default
    
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
  }
}

/*
 NOTES
- Bindings will always tie a particular user interface view to a particular state value
- To insert code in a string use "\(put var here")"
 */
