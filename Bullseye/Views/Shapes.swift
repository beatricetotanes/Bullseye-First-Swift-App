//
//  Shapes.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 12/20/21.
//

import SwiftUI

struct Shapes: View {
  var body: some View {
    VStack{
      Circle()
        // to ensure that the circle stays within the boundaries while having stroke
        .strokeBorder(Color.blue, lineWidth: 20.0)
        .frame(width: 200, height: 100)
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.blue)
        .frame(width: 200, height: 100)
      Capsule()
        .fill(Color.blue)
        .frame(width: 200, height: 100)
      Ellipse()
        .fill(Color.blue)
        .frame(width: 200, height: 100)
    }
    .background(Color.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
