//
//  RoundViews.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 12/20/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String // name of the SF symbols we're trying to use
  
  var body: some View {
    // symbol through image; systemName allows you to pass the name of a SFSymbol
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(Circle()
                .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String // name of the SF symbols we're trying to use
  
  var body: some View {
    // symbol through image; systemName allows you to pass the name of a SFSymbol
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .background(Circle()
                    .fill(Color("ButtonFilledBackgroundColor")))
  }
}

struct RoundRectTextView: View {
  var text: String
  
  var body: some View{
    Text(text)
      .bold()
      .font(.title3)
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWidth)
          .foregroundColor(Color("ButtonStrokeColor"))
      )
  }
  
}

struct PreviewView: View {
  var body: some View{
    // you can put spacing (optional) instead of having to put padding one by one
    VStack (spacing: 10){
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
      RoundRectTextView(text: "999")
    }
  }
}

struct RoundViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
