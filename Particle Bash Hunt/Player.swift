//
//  Player.swift
//  Particle Bash Hunt
//
//  Created by Andreas on 20/06/14.
//  Copyright (c) 2014 Andreas. All rights reserved.
//

import SpriteKit

enum Direction: Float {
    case port = 0.5, starboard = 1.5, bow = 2, aft = 1
    var radians: Float {
        return self.toRaw() * Float(pi) % (2 * Float(pi))
    }
}

class Player: SKNode {
    
    var thruster = Thruster()

    var heading:CGVector {
        return physicsBody.velocity
    }
    
    init() {
        super.init()
        
        let sprite = createModel()
        let scale = 5.0
        sprite.lineWidth *= scale
        sprite.setScale(1 / scale)
        self.addChild(sprite)
        
        physicsBody = SKPhysicsBody(circleOfRadius: 20)
        physicsBody.mass = 1000
        physicsBody.dynamic = true
        physicsBody.categoryBitMask = CollisionCategories.Ship.toRaw()
        physicsBody.contactTestBitMask = CollisionCategories.Planet.toRaw()
        physicsBody.allowsRotation = false
        
        self.addChild(thruster)
    }
    
    func update() {
        zRotation = CGFloat(heading.angle)
    }
    
    func thrust(direction: Direction) {
        var dirvec = heading.normalized()
        dirvec.angle += direction.radians
        thruster.flash(direction.radians + Float(pi))
        physicsBody.applyImpulse(20000 * dirvec)
    }
    
    func createModel() -> SKShapeNode {
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 97, 173);
        CGPathAddLineToPoint(path, nil, 80, 126)
        CGPathAddLineToPoint(path, nil, 65, 121)
        CGPathAddLineToPoint(path, nil, 68, 107)
        CGPathAddLineToPoint(path, nil, 0, 45)
        CGPathAddLineToPoint(path, nil, 18, 13)
        CGPathAddLineToPoint(path, nil, 71, 14)
        CGPathAddLineToPoint(path, nil, 76, 1)
        CGPathAddLineToPoint(path, nil, 96, 0)
        CGPathAddLineToPoint(path, nil, 98, 4)
        CGPathAddLineToPoint(path, nil, 101, 0)
        CGPathAddLineToPoint(path, nil, 121, 1)
        CGPathAddLineToPoint(path, nil, 123, 14)
        CGPathAddLineToPoint(path, nil, 180, 14)
        CGPathAddLineToPoint(path, nil, 196, 45)
        CGPathAddLineToPoint(path, nil, 127, 107)
        CGPathAddLineToPoint(path, nil, 130, 122)
        CGPathAddLineToPoint(path, nil, 115, 128)
        CGPathAddLineToPoint(path, nil, 97, 173)
        
        return SKShapeNode(path: path, centered: true)
    }
}