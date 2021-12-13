//
//  Game.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 11/20/21.
//

import Foundation

struct Game {
  var target: Int = Int.random(in: 1...100)
  var score: Int = 0
  var round: Int = 1
  
  func points(sliderValue: Int) -> Int {
    // you can omit 'return' if you only have one line in the function
    100 - abs(target - sliderValue)
  }
  
}
