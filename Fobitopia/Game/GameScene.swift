//
//  GameScene.swift
//  Fobitopia
//
//  Created by Diego Aragon on 25/09/18.
//  Copyright © 2018 Diego Aragon. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit


let RamCateogryName = "ram"
let RamCategory : UInt32 = 0x1 << 0

class GameScene: SKScene {
    
    
    var dirX: CGFloat = 0.0
    var playerRam : SKSpriteNode!
    var isFingerOnCha = false
    
    var gameViewController: GameViewController!
    //Game Controls
    var gameControls: GameControls!
    
    private var lastUpdateTime : TimeInterval = 0
    
    //Custom Initializer
    init(sceneSize: CGSize, referenceGVC: GameViewController){
        
        //Set reference of GameViewControl
        gameViewController = referenceGVC
        
        //Create scene from code
        super.init(size: sceneSize)
        
        //Game Controls
        gameControls = GameControls.init(inThisScene: self)
        
        //Load scene
        if let skView = gameViewController.view as! SKView? {
            
            self.size = skView.bounds.size
            self.scaleMode = .fill
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView) {
        self.addChild(gameControls.house)
        self.addChild(gameControls.playerRam)
        
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        physicsWorld.contactDelegate = self as? SKPhysicsContactDelegate
        //Ramysten MovementControls
        let ram = gameControls.playerRam
        
        ram.position = CGPoint(x: self.size.width/2, y: self.size.height * (12.29/100))
        ram.physicsBody!.categoryBitMask = RamCategory
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if let body = physicsWorld.body(at: touchLocation){
            if body.node!.name == RamCateogryName {
                isFingerOnCha = true
            }
            
            for touch in touches {
                let location = touch.location(in: self)
                let item = atPoint(location)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isFingerOnCha{
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            let playerRam = childNode(withName: RamCateogryName) as! SKSpriteNode
            
            var chaX = playerRam.position.x + (touchLocation.x - previousLocation.x)
            
            chaX = max(chaX, playerRam.size.width/2)
            chaX = min(chaX, size.width - playerRam.size.width/2)
            
            playerRam.position = CGPoint(x: chaX, y: playerRam.position.y)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnCha = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    //
}
