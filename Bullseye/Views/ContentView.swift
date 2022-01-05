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
    // Whenever you put a view inside the ZStack, it centers that view within the ZStack
    ZStack {
      //rgb(243, 248, 253)
      // Swift wants values between zero to one so we convert the range
      // Color(red: 243 / 255, green: 248 / 255, blue: 253 / 255) - one way to do this
      // ignores safe area; safe area is where the battery, etc. goes at the top
      //    Color("BackgroundColor") // from asset catalog
      //        .edgesIgnoringSafeArea(.all)
      BackgroundView(game: $game)
      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? CGFloat(0) : 100)
        if alertIsVisible{
          PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        } else {
          HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }
      }
      if !alertIsVisible{
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
  }
}

struct InstructionsView: View {
  // binding to access/reference state variable
  // no initialization because it will be passed down
  @Binding var game: Game
  
  var body: some View{
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View{
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }.padding()
  }
}

struct HitMeButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View{
    Button(action: {
      // When this happens, we want to apply animation.
      withAnimation {
        alertIsVisible = true
      }
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
    // view that gets drawn on top of everything else; alternative to ZStack
    .overlay(
      RoundedRectangle(cornerRadius: 21)
        .strokeBorder(Color.white, lineWidth: 2.0)
    )
    // isPresented keeps track whether the alert is visible or not
    // There is a '$' before 'alertIsVisible' to convert the state variable into a binding
    // default alert
    //    .alert(isPresented: $alertIsVisible, content: {
    //      let roundedValue = Int(sliderValue.rounded())
    //      let points = (game.points(sliderValue: roundedValue))
    //      // returns what alert we want to show;
    //      // For dismissButton, it wants us to return an alert button
    //      return Alert(title: Text("Hello There"), message: Text("The slider's value is \(roundedValue). \n" + "You scored \(points) points this round"), dismissButton: //.default returns an Alert Button
    //                    .default(Text("Awesome")){
    //                      // code that runs after the user taps the dismiss button
    //                      game.startNewRound(points: points)
    //                    }
    //
    //      )
    //    })
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
