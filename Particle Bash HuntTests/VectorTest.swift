//
//  VectorTest.swift
//  Particle Bash Hunt
//
//  Created by Andreas on 28/06/14.
//  Copyright (c) 2014 Andreas. All rights reserved.
//

import XCTest

class VectorTest: XCTestCase {
    
    func testSetMagnitude() {
        var vec = CGVector(1, 1)
        vec.magnitude = 5
        XCTAssertEqual(vec.magnitude, 5)
    }

    func testSetAngle() {
        var vec = CGVector(1, 1)
        var a = vec.angle
        vec.angle = 2
        XCTAssertEqual(vec.angle, 2)
    }

}
