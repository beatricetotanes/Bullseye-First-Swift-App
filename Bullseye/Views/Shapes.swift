//
//  Shapes.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 12/20/21.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShapes = true
  
  var body: some View {
    VStack{
      if !wideShapes {
        Circle()
          // to ensure that the circle stays within the boundaries while having stroke
          .strokeBorder(Color.blue, lineWidth: 20.0)
          .frame(width: 200, height: 100)
          //.transition(.slide)
      }
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.blue)
        .frame(width: wideShapes ? CGFloat(200) : 100, height: 100)
        //.animation(.easeInOut)
      Capsule()
        .fill(Color.blue)
        .frame(width: wideShapes ? CGFloat(200) : 100, height: 100)
      Ellipse()
        .fill(Color.blue)
        .frame(width: wideShapes ? CGFloat(200) : 100, height: 100)
      Button(action: {
        // Instead of animating the shapes one by one, you can use the default animation with
        // this command for all the shapes
        withAnimation{
          wideShapes.toggle()
        }
      }) {
        Text("Animate!")
      }
    }
    .background(Color.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
