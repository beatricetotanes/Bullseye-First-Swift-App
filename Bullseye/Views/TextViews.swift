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
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      SliderLabelText(text: "Test")
      InstructionText(text: "Instructions")
      BigNumberText(text: "29")
    }
  }
}
