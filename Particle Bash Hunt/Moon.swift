//
//  Moon.swift
//  Particle Bash Hunt
//
//  Created by Andreas on 20/06/14.
//  Copyright (c) 2014 Andreas. All rights reserved.
//

import SpriteKit

class Moon: SKNode {
    
    init() {
        super.init()
        let radius = 100
        let sprite = SKShapeNode(circleOfRadius: CGFloat(radius))
        self.addChild(sprite)
        
        physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(radius))
        physicsBody.mass = 7.34 * pow(10, 14)
        physicsBody.categoryBitMask = CollisionCategories.Planet.toRaw()
    }
    
}