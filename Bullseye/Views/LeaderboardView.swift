//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 1/8/22.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var leaderboardIsShowing: Bool
  
  var body: some View {
    // Date() gives the current date and time
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 10) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        RowView(index: 1, score: 10, date: Date())
      }
    }
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
//      Slider(value: .constant(50.0))
//        .padding()
    }
    .background(
      RoundedRectangle(
        // ".infinity" it'll make it as round as it can, as much space as there is
        cornerRadius: .infinity
      )
      // stroke border will prevent it from going outside the bounds (which it would if we were to use the regular stroke
      .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct HeaderView: View {
  @Binding var leaderboardIsShowing: Bool
  @Environment(\.verticalSizeClass) var vertcalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View{
    // Putting this in a ZStack because we want the BigBoldText to be centered and the other one right justified
    ZStack {
      HStack {
        if vertcalSizeClass == .regular && horizontalSizeClass == .compact{
          BigBoldText(text: "Leaderboard")
            .padding(.leading)
          Spacer()
        } else {
          BigBoldText(text: "Leaderboard")
        }
      } // centered by default
      HStack{
        Spacer() // takes all the space on the left and push whatever we put after that on the right
        Button(action: {
          leaderboardIsShowing = false
        }) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }
}

struct LabelView: View {
  var body: some View{
    HStack{
      Spacer() // fixed width for spacer
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static private var leaderboardIsShowing = Binding.constant(false)
  
  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
      .preferredColorScheme(.light) // default
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
      .previewLayout(.fixed(width: 568, height: 320))
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
      .preferredColorScheme(.dark) // default
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
