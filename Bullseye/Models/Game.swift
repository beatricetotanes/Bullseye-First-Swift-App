//
//  Game.swift
//  Bullseye
//
//  Created by Beatrice Totanes on 11/20/21.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target: Int = Int.random(in: 1...100)
  var score: Int = 0
  var round: Int = 1
  var leaderboardEntries: [LeaderboardEntry] = [] // array of leaderboard entry type; need to specify type since it is an empty array
  
  // initializer to load test data
  init(loadTestData: Bool = false) {
    if loadTestData == true{
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
    }
  }
  
  func points(sliderValue: Int) -> Int {
    // you can omit 'return' if you only have one line in the function
    let difference = abs(target - sliderValue)
    let bonus: Int // For bonus points
    
    if difference == 0 {
      bonus = 100 // Additional 100 points if the user hits target perfectly
    } else if difference <= 2{
      bonus = 50 // Additional 50 points if the user hits target so close
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
    addToLeaderboard(point: points)
  }
  mutating func restart() {
    round = 1
    score = 0
    target = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderboard(point: Int){
    leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
    leaderboardEntries.sort{$0.score > $1.score}
  }
  
}
