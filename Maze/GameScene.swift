//
//  GameScene.swift
//  Maze
//
//  Created by Mattias Welamsson on 2020-07-14.
//  Copyright © 2020 Mattias Welamsson. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    var player = SKSpriteNode()
    var endNode = SKSpriteNode()
    override func didMove(to view: SKView) {
        
        
        self.physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        
        endNode = self.childNode(withName: "end") as! SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main) {
            (data, error) in
            
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)! * 10), dy: CGFloat((data?.acceleration.y)!) * 10 )
            
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        var bodyA = contact.bodyA
        var bodyB = contact.bodyB
        
        // if below statement or statement after || is true then we get to run whatever is down below.
        // if bodyA kolliderar med bodyB eller vise versa och deras "Masker" är 1 eller 2. Vi kollar om det är en player eller end som krashar.
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1 {
            
            print("You won!")
        }
    }


override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
}

}
