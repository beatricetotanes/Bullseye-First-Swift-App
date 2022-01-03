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
      Color("BackgroundColor").edgesIgnoringSafeArea(.all)
    )
  }
}

struct TopView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
      }) {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      // Spacer extends to use as much space as available
      Spacer()
      RoundedImageViewFilled(systemName: "list.dash")
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

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
