//
//  GameControls.swift
//  Fobitopia
//
//  Created by Ismael Serrano on 9/27/18.
//  Copyright © 2018 Diego Aragon. All rights reserved.
//
import SpriteKit

struct GameControls {
    
    
    //Screen barrier
    let borderBody: SKPhysicsBody
    
    //Background
    let house: SKSpriteNode
    let fence: SKSpriteNode
    
    //Dpad
    let dirUp: SKSpriteNode
    let dirLeft: SKSpriteNode
    let dirRight: SKSpriteNode
    let dirDown: SKSpriteNode
    
    //Animations
    var ramBack: SKAction
    var ramFront: SKAction
    
    //Characters
    var playerRam: SKSpriteNode

    init(inThisScene: GameScene){
        
        //Dpad
        dirUp = SKSpriteNode.init(imageNamed: "dirU")
        dirUp.name = "up"
        dirUp.zPosition = 15
        dirUp.position = CGPoint(
            x: (inThisScene.size.width * (((285 + (dirUp.size.width / 2)) / 1920 ) * 100) / 100),
            //x: (inThisScene.size.width  * 90/100),
            y: (inThisScene.size.height * (((335 + (dirUp.size.height / 2)) / 1080 ) * 100) / 100)
        )
        
        dirLeft = SKSpriteNode.init(imageNamed: "dirL")
        dirLeft.name = "left"
        dirLeft.zPosition = 15
        dirLeft.position = CGPoint(
            x: (inThisScene.size.width * (((150 + (dirLeft.size.width / 2)) / 1920 ) * 100) / 100),
            //x: (inThisScene.size.width  * 90/100),
            y: (inThisScene.size.height * (((200 + (dirLeft.size.height / 2)) / 1080 ) * 100) / 100)
        )
        
        dirRight = SKSpriteNode.init(imageNamed: "dirR")
        dirRight.name = "right"
        dirRight.zPosition = 15
        dirRight.position = CGPoint(
            x: (inThisScene.size.width * (((420 + (dirRight.size.width / 2)) / 1920 ) * 100) / 100),
            //x: (inThisScene.size.width  * 90/100),
            y: (inThisScene.size.height * (((200 + (dirRight.size.height / 2)) / 1080 ) * 100) / 100)
        )
        
        dirDown = SKSpriteNode.init(imageNamed: "dirD")
        dirDown.name = "down"
        dirDown.zPosition = 15
        dirDown.position = CGPoint(
            x: (inThisScene.size.width * (((285 + (dirDown.size.width / 2)) / 1920 ) * 100) / 100),
            //x: (inThisScene.size.width  * 90/100),
            y: (inThisScene.size.height * (((65 + (dirDown.size.height / 2)) / 1080 ) * 100) / 100)
        )
        
       //Barrier
        borderBody = SKPhysicsBody(edgeLoopFrom: inThisScene.frame)
        borderBody.friction = 0
        inThisScene.physicsBody = borderBody
        
        //Init Background
        house = SKSpriteNode.init(imageNamed: "house1")
        house.name = "house"
        house.zPosition = 0
        house.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        house.size = CGSize(width: inThisScene.size.width, height: inThisScene.size.height)
        
        fence = SKSpriteNode.init(imageNamed:"object")
        fence.name = "fence"
        fence.zPosition = 1
        fence.position = CGPoint(
            x: (inThisScene.size.width / 2),
             y: (inThisScene.size.height * (((490 + (fence.size.height / 2)) / 1920 ) * 100) / 100)
        )
        fence.size = CGSize(
            width: (fence.size.width * (inThisScene.size.width / fence.size.width)*(((fence.size.width/1920)*100)/100)),
            height: (fence.size.height * (inThisScene.size.height / fence.size.height)*(((fence.size.height/1080)*100)/100))
        )
        fence.physicsBody = SKPhysicsBody.init(rectangleOf: fence.size)
        fence.physicsBody?.affectedByGravity = false
        fence.physicsBody?.isDynamic = false
        fence.physicsBody?.allowsRotation = false
        fence.physicsBody?.categoryBitMask = fenceCategory
        fence.physicsBody?.collisionBitMask = playerCategory
        
        //House animation
        var houseAnimationTextures:[SKTexture] = []
        for i in 1...2{
            houseAnimationTextures.append(SKTexture(imageNamed: "house\(i)"))
        }
        var houseAnimation:SKAction
        houseAnimation = SKAction.animate(with: houseAnimationTextures, timePerFrame: 0.40)
        house.run(SKAction.group([
            SKAction.repeatForever(
                SKAction.sequence([
                    SKAction.repeat(houseAnimation, count: 1),
                    SKAction.repeat(houseAnimation, count: 1).reversed()
                    ]))]))
        
        
        //Init Character Ramstey
        playerRam = SKSpriteNode(imageNamed: "RIdle1")
        playerRam.name = "ram"
        playerRam.zPosition = 2
        playerRam.position = CGPoint(
            x: (inThisScene.size.width * (((785 + (playerRam.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height/2)
        )
        playerRam.size = CGSize(
            width: (playerRam.size.width * (inThisScene.size.width / playerRam.size.width)*(((playerRam.size.width/1920)*100)/100)),
            height: (playerRam.size.height * (inThisScene.size.height / playerRam.size.height)*(((playerRam.size.height/1080)*100)/100))
        )
        playerRam.physicsBody = SKPhysicsBody.init(rectangleOf: playerRam.size)
        playerRam.physicsBody?.affectedByGravity = false
        playerRam.physicsBody?.isDynamic = false
        playerRam.physicsBody?.categoryBitMask = playerCategory
        playerRam.physicsBody?.collisionBitMask = fenceCategory
        playerRam.physicsBody?.allowsRotation = false
        
        
        //Back Animation
        var ramBackTextures:[SKTexture] = []
        for i in 1...4{
            ramBackTextures.append(SKTexture(imageNamed: "RBack\(i)"))
        }
      
        ramBack = SKAction.animate(with: ramBackTextures, timePerFrame: 0.25)
        
        
        //Idle Animation
        var ramIdleTextures:[SKTexture] = []
        for i in 1...2{
            ramIdleTextures.append(SKTexture(imageNamed: "RIdle\(i)"))
        }
        var ramIdle:SKAction
        ramIdle = SKAction.animate(with: ramIdleTextures, timePerFrame: 0.25)
        
        //Front Animation
        var ramFrontTextures:[SKTexture] = []
        for i in 1...2{
            ramFrontTextures.append(SKTexture(imageNamed: "RFront\(i)"))
        }
        ramFront = SKAction.animate(with: ramFrontTextures, timePerFrame: 0.25)
        
       

        playerRam.run(
            SKAction.group([
                SKAction.repeatForever(
                    SKAction.sequence([
                        SKAction.repeat(ramIdle, count: 1),
                        SKAction.repeat(ramIdle, count: 1).reversed()
                        ]))]))
        
//        playerRam.run(
//            SKAction.group([
//                SKAction.repeatForever(
//                    SKAction.sequence([
//                        SKAction.repeat(ramFront, count: 1),
//                        SKAction.repeat(ramFront, count: 1).reversed()
//                        ]))]))
//        
//        playerRam.run(
//            SKAction.group([
//                SKAction.repeatForever(
//                    SKAction.sequence([
//                        SKAction.repeat(ramBack, count: 1),
//                        SKAction.repeat(ramBack, count: 1).reversed()
//                        ]))]))
    }
    
}
