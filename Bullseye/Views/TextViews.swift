//
//  TextViews.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 12/20/21.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TextColor"))
      .bold()
      .kerning(2.0)
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .font(.largeTitle)
      .kerning(-1.0)
      .fontWeight(.black)
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View{
    Text(text)
      .foregroundColor(Color("TextColor"))
      .bold()
      .frame(width: 35)
  }
}

struct LabelText: View {
  var text: String
  
  var body: some View{
    Text(text)
      .foregroundColor(Color("TextColor"))
      .font(.caption)
      .kerning(1.5)
      .bold()
  }
}

struct BodyText: View {
  var text: String
  
  var body: some View{
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .lineSpacing(12)
      .foregroundColor(Color("TextColor"))
      .multilineTextAlignment(.center)
  }
}

struct ButtonText: View {
  var text: String
  
  var body: some View{
    Text(text)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .font(.headline)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .cornerRadius(12)
  }
}

  
  struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        SliderLabelText(text: "Test")
        InstructionText(text: "Instructions")
        BigNumberText(text: "29")
        LabelText(text: "Score")
        BodyText(text: "You scored 200 Points\n🎉🎉🎉")
        ButtonText(text: "Start New Round")
      }
      .padding()
    }
  }
