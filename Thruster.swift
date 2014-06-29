//
//  Thruster.swift
//  Particle Bash Hunt
//
//  Created by Andreas on 29/06/14.
//  Copyright (c) 2014 Andreas. All rights reserved.
//

import SpriteKit


class Thruster: SKNode {
    var particles = SKEmitterNode()
    var birthrate: CGFloat = 0
    
    init() {
        super.init()
            
        let path = NSBundle.mainBundle().pathForResource("thruster", ofType: "sks")
        var data = NSData.dataWithContentsOfFile(path, options: .DataReadingMappedIfSafe, error: nil)
        var archiver = NSKeyedUnarchiver(forReadingWithData: data)
        archiver.setClass(SKEmitterNode.classForKeyedUnarchiver(), forClassName: "SKEmitterNode")
        particles = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as SKEmitterNode
        archiver.finishDecoding()
        self.addChild(particles)
        particles.targetNode = self.parent
        
        birthrate = particles.particleBirthRate
        turnOff()
    }
    
    func turnOff() {
        particles.particleBirthRate = 0
    }
    
    func turnOn() {
        particles.particleBirthRate = birthrate
    }
    
    func flash(direction: Float) {
        self.runAction(SKAction.sequence([
            SKAction.rotateToAngle(CGFloat(direction), duration: 0),
            SKAction.runBlock {
                self.turnOn()
            },
            SKAction.waitForDuration(0.1),
            SKAction.runBlock {
                self.turnOff()
            }
        ]))
    }
}