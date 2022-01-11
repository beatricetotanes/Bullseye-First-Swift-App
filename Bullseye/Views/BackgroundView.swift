//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 12/29/21.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack{
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
  }
}

struct TopView: View {
  @Binding var game: Game
  @State private var leaderboardIsShowing = false
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
      }) {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      // Spacer extends to use as much space as available
      Spacer()
      Button(action: {
        leaderboardIsShowing = true
      }) {
        RoundedImageViewFilled(systemName: "list.dash")
      }
      // goes to different screen
      // If $leaderboardIsShowing == true, then it will show the leaderboard screen. Else, not or it will close it.
      .sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
        LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
      })
    }
  }
}

struct NumberView: View {
  var title: String
  var text: String
  
  var body: some View{
    VStack(spacing: 5){
      LabelText(text: title.uppercased())
      RoundRectTextView(text: text)
    }
  }
  
}

struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      NumberView(title: "Score", text: String(game.score))
      // Spacer extends to use as much space as available
      Spacer()
      NumberView(title: "Round", text: String(game.round))
    }
  }
}

struct RingsView: View {
  
  // To know whether user is using light/dark mode
  // @Environment - environment property wrapper; to access the environment the views are in
  // Format: @Environment(\.keyPath) var propertyName
  // Key path is a special name defined by apple for each environment property
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View{
    ZStack{
      Color("BackgroundColor").edgesIgnoringSafeArea(.all)
      //ForEach allows you to create a view for each element in the range
      // "ring" will be the value in the sequence we're currently in;
      // Ex: The 1st time we go into ForEach, "ring" will be 1.
      ForEach(1..<6){ ring in
        let size = CGFloat(ring * 100) //CGFloat since ".frame" wants this type instead of Int or Double
        let opacity = colorScheme == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(
            RadialGradient(gradient:  Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
          )
          .frame(width: size, height: size)
      }
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
