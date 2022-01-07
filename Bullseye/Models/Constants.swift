//
//  Models.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 1/7/22.
//

import Foundation
import UIKit

// To avoid magic numbers, use constants so that you can change values more easily and have clean code.

// You can think of "enum" as a type that contains a list of different options.
enum Constants {
  enum General {
    // CGFloat is similar to a double but it's just a type that is expected by shapes, etc. instead of a double
    public static let strokeWidth = CGFloat(2.0)
    public static let roundedViewLength = CGFloat(56.0)
    public static let roundRectViewWidth = CGFloat(68.0)
    public static let roundRectViewHeight = CGFloat(56.0)
    public static let roundRectCornerRadius = CGFloat(21.0)
  }
}

