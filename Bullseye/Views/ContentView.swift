//
//  ContentView.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 11/19/21.
//
// AccentColor is used by some controls to give them a splash of color.

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
    // ZStack is like a VStack/HStack, and that stacks other views together, but in a Z order
    // -Z value is far away in the background while a +Z value would be in the foreground but they're all stacked on top of each other
    ZStack {
      //rgb(243, 248, 253)
      // Swift wants values between zero to one so we convert the range
      //Color(red: 243 / 255, green: 248 / 255, blue: 253 / 255) - one way to do this
      // ignores safe area; safe area is where the battery, etc. goes at the top
    Color("BackgroundColor") // from asset catalog
        .edgesIgnoringSafeArea(.all)
      VStack {
        Text("🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
          .foregroundColor(Color("TextColor"))
          .bold()
          .kerning(2.0)
          .multilineTextAlignment(.center)
          .lineSpacing(4.0)
          .font(.footnote)
          .padding(.leading, 30.0)
          .padding(.trailing, 30.0)
          
        Text(String(game.target))
          .foregroundColor(Color("TextColor"))
          .font(.largeTitle)
          .kerning(-1.0)
          .fontWeight(.black)
        HStack {
          Text("1")
            .foregroundColor(Color("TextColor"))
            .bold()
          Slider(value: $sliderValue, in: 1.0...100.0)
          Text("100")
            .foregroundColor(Color("TextColor"))
            .bold()
        }
        .padding()
        Button(action: {
          print("Hello")
          alertIsVisible = true
        }) {
          Text("Hit Me".uppercased())
            .bold()
            .font(.title3)
        }
        .padding(20.0)
        .background(
          // implements the gradient via a zstack
          ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom) // on top of the bgcolor
          }
        )
        .foregroundColor(.white)
        .cornerRadius(21)
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
}

// Controls the preview on the righthand side
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.light) // default
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
    ContentView()
      .preferredColorScheme(.dark) // default
    ContentView()
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}

/*
 NOTES
- Bindings will always tie a particular user interface view to a particular state value
- To insert code in a string use "\(put var here")"
 */
