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
let playerCategory : UInt32 = 0x1 << 0
let fenceCategory : UInt32 = 0x1 << 1
let BorderCategory : UInt32 = 0x1 << 2

class GameScene: SKScene {
    
    
    var dirX: CGFloat = 0.0
    var playerRam : SKSpriteNode!
 
    
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
        self.addChild(gameControls.fence)
        self.addChild(gameControls.dirUp)
        self.addChild(gameControls.dirLeft)
        self.addChild(gameControls.dirRight)
        self.addChild(gameControls.dirDown)
        
        //Test
        let player = gameControls.playerRam
        let fen = gameControls.fence
        
        player.physicsBody = SKPhysicsBody.init(rectangleOf: gameControls.playerRam.size)
        fen.physicsBody = SKPhysicsBody.init(rectangleOf: gameControls.fence.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.allowsRotation = false
        
        fen.position = gameControls.fence.position
        fen.physicsBody?.affectedByGravity = false
        fen.physicsBody?.allowsRotation = false
        fen.physicsBody?.isDynamic = false
        
        
        player.physicsBody?.categoryBitMask = playerCategory
        fen.physicsBody?.categoryBitMask = fenceCategory
        gameControls.borderBody.categoryBitMask = BorderCategory
        
        fen.physicsBody?.contactTestBitMask = BorderCategory | playerCategory
        player.physicsBody?.contactTestBitMask = BorderCategory | fenceCategory
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        
        print(gameControls.playerRam.position.y)
        print(touchLocation.x)
        
        
        if gameControls.playerRam.position.y > touchLocation.y {
        //Goes Up
            gameControls.playerRam.run(SKAction.scaleY(to: 1, duration: 0.1))

                    gameControls.playerRam.run(
                        SKAction.group([
                            SKAction.repeatForever(
                                SKAction.sequence([
                                    SKAction.repeat(gameControls.ramFront, count: 1),
                                    SKAction.repeat(gameControls.ramFront, count: 1).reversed()
                                    ]))]))
            
        }
         else if (gameControls.playerRam.position.y > touchLocation.y) {
            gameControls.playerRam.run(SKAction.scaleY(to: 1, duration: 0.1))
            
                    gameControls.playerRam.run(
                        SKAction.group([
                            SKAction.repeatForever(
                                SKAction.sequence([
                                    SKAction.repeat(gameControls.ramBack, count: 1),
                                    SKAction.repeat(gameControls.ramBack, count: 1).reversed()
                                    ]))]))
            
        }
        
        if(gameControls.playerRam.position.x > touchLocation.x){
            gameControls.playerRam.run(SKAction.scaleX(to: 1, duration: 0.1))
            
            gameControls.playerRam.run(SKAction.group([SKAction.repeatForever(SKAction.sequence([SKAction.repeat(gameControls.ramBack, count: 1),
                SKAction.repeat(gameControls.ramBack, count: 1).reversed()                                                                                 ]))]))
        }
        
        else if(gameControls.playerRam.position.x > touchLocation.x){
            gameControls.playerRam.run(SKAction.scaleX(to: 1, duration: 0.1))
            
            gameControls.playerRam.run(SKAction.group([SKAction.repeatForever(SKAction.sequence([SKAction.repeat(gameControls.ramFront, count: 1),
                SKAction.repeat(gameControls.ramFront, count: 1).reversed()                                                                                 ]))]))
            
        }
        
        let xDist = (gameControls.playerRam.position.x - touchLocation.x)
        let yDist = (gameControls.playerRam.position.y - touchLocation.y)
        
        let distance = sqrt((xDist * xDist) + (yDist * yDist))
        
        let speed:CGFloat = 500.0
        let duration: CGFloat = distance/speed
        
        
        
        gameControls.playerRam.removeAction(forKey: "moveRamUp")
        gameControls.playerRam.removeAction(forKey: "moveRamSide")

        gameControls.playerRam.run(SKAction.moveTo(y: touchLocation.y, duration: TimeInterval(duration)), withKey: "moveRamUp")
        
        gameControls.playerRam.run(SKAction.moveTo(x: touchLocation.x, duration: TimeInterval(duration)), withKey: "moveRamSide")
    }
    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    //
}
