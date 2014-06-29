//
//  PlayerTest.swift
//  Particle Bash Hunt
//
//  Created by Andreas on 28/06/14.
//  Copyright (c) 2014 Andreas. All rights reserved.
//

import XCTest

class PlayerTest: XCTestCase {
    var player = Player()

    override func setUp() {
        player = Player()
    }

    func testDirectionBow() {
        XCTAssertEqual(Direction.bow.radians, 0)
    }
    
    func testDirectionAft() {
        XCTAssertEqual(Direction.aft.radians, Float(pi))
    }
    
    func testDirectionPort() {
        XCTAssertEqual(Direction.port.radians, 3 * Float(pi) / 2)
    }
    
    func testDirectionStarboard() {
        XCTAssertEqual(Direction.starboard.radians, Float(pi) / 2)
    }

}
