//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Beatrice Totanes on 12/1/21.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
  
  //optional variable; may or may not be set to a value
  // the exclamation mark indicates that even if there is no value, treat it as if the value will definitely be there
  var game: Game!
  

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      game = nil
    }

  func testScorePositive() {
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testNewRound() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.score, 100)
    XCTAssertEqual(game.round, 2)
  }


}
