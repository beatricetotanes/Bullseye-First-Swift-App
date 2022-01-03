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
    let difference = abs(target - sliderValue)
    let bonus: Int
    
    if difference == 0 {
      bonus = 100
    } else if difference <= 2{
      bonus = 50
    } else {
      bonus = 0
    }
    
    return 100 - difference + bonus
  }
  
  // use "mutating" because it indicates that the method will change the values on the struct itself
  mutating func startNewRound(points: Int) {
    round += 1
    score += points
    target = Int.random(in: 1...100)
  }
  
}
