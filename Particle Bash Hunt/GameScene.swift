//
//  GameScene.swift
//  Particle Bash Hunt
//
//  Created by Andreas on 20/06/14.
//  Copyright (c) 2014 Andreas. All rights reserved.
//

import SpriteKit

enum Key: Int {
    case right = 124, left = 123, up = 126, down = 125
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let player = Player()
    var planets: Moon[] = []
    
    override func didMoveToView(view: SKView) {
        let center = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        
        let moon1 = Moon()
        moon1.position = center
        addChild(moon1)
        planets += moon1
        
        player.position = center
        player.position.x += 400
        player.physicsBody.velocity = CGVector(0, -250)
        addChild(player)
        
        physicsWorld.gravity = CGVector(0, 0)
        physicsWorld.contactDelegate = self
    }
    
    override func keyDown(event: NSEvent!) {
        if let key = Key.fromRaw(Int(event.keyCode))? {

        }
    }
    
    override func keyUp(event: NSEvent!) {
        if let key = Key.fromRaw(Int(event.keyCode))? {
            switch key {
            case Key.up:
                player.thrust(.bow)
            case Key.right:
                player.thrust(.starboard)
            case Key.left:
                player.thrust(.port)
            case Key.down:
                player.thrust(.aft)
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        let G = Float(6.67384 * pow(10, -11)) // N m^2 kg^-2
        for planet in planets {
            let distance = planet.position.distance(player.position)
            let m1 = Float(planet.physicsBody.mass)
            let m2 = Float(player.physicsBody.mass)
            let F = G * m1 * m2 / distance      // https://en.wikipedia.org/wiki/Gravitational_constant
            let diff = planet.position - player.position
            player.physicsBody.applyForce(F * diff.normalized())
            player.update()
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact!) {
        println("Hello")
    }
    
}
