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
    
    
    
    //Animations
    var ramIdle: SKAction
    var ramBack: SKAction
    var ramFront: SKAction
    var ramLeft: SKAction
    var ramRight: SKAction
    var morIdle: SKAction
    var morLeft: SKAction
    var morRight: SKAction
    
    //Characters
    var playerRam: SKSpriteNode
    var playerMor: SKSpriteNode

    init(inThisScene: GameScene){
        
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
        
        //Ram Animation
        //Idle Animation
        var ramIdleTextures:[SKTexture] = []
        for i in 1...2{
            ramIdleTextures.append(SKTexture(imageNamed: "RIdle\(i)"))
        }
        
        ramIdle = SKAction.animate(with: ramIdleTextures, timePerFrame: 0.25)
        
        //Front Animation
        var ramFrontTextures:[SKTexture] = []
        for i in 1...2{
            ramFrontTextures.append(SKTexture(imageNamed: "RFront\(i)"))
        }
        ramFront = SKAction.animate(with: ramFrontTextures, timePerFrame: 0.25)
        
        //Left Animation
        var ramLeftTextures:[SKTexture] = []
        for i in 1...2{
            ramLeftTextures.append(SKTexture(imageNamed: "RLeft\(i)"))
        }
        ramLeft = SKAction.animate(with: ramLeftTextures, timePerFrame: 0.25)
        
        //Right
        var ramRightTextures:[SKTexture] = []
        for i in 1...2{
            ramRightTextures.append(SKTexture(imageNamed: "RRight\(i)"))
        }
        ramRight = SKAction.animate(with: ramRightTextures, timePerFrame: 0.25)
       

        playerRam.run(
            SKAction.group([
                SKAction.repeatForever(
                    SKAction.sequence([
                        SKAction.repeat(ramIdle, count: 1),
                        SKAction.repeat(ramIdle, count: 1).reversed()
                        ]))]))
        
        //Init Player Morgan
        playerMor = SKSpriteNode(imageNamed: "MIdle1")
        playerMor.name = "mor"
        playerMor.zPosition = 2
        playerMor.position = CGPoint(
            x: (inThisScene.size.width * (((785 + (playerMor.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height/2)
        )
        playerMor.size = CGSize(
            width: (playerMor.size.width * (inThisScene.size.width / playerMor.size.width)*(((playerMor.size.width/1920)*100)/100)),
            height: (playerMor.size.height * (inThisScene.size.height / playerMor.size.height)*(((playerMor.size.height/1080)*100)/100))
        )
        playerMor.physicsBody = SKPhysicsBody.init(rectangleOf: playerRam.size)
        playerMor.physicsBody?.affectedByGravity = false
        playerMor.physicsBody?.isDynamic = false
        playerMor.physicsBody?.categoryBitMask = playerCategory
        playerMor.physicsBody?.collisionBitMask = fenceCategory
        playerMor.physicsBody?.allowsRotation = false
        
        //Mor Animation
        //Idle Animation
        var morIdleTextures:[SKTexture] = []
        for i in 1...2{
            morIdleTextures.append(SKTexture(imageNamed: "MIdle\(i)"))
        }
        
        morIdle = SKAction.animate(with: morIdleTextures, timePerFrame: 0.25)
        
        
        //Left Animation
        var morLeftTextures:[SKTexture] = []
        for i in 1...2{
            morLeftTextures.append(SKTexture(imageNamed: "MLeft\(i)"))
        }
        morLeft = SKAction.animate(with: morLeftTextures, timePerFrame: 0.25)
        
        //Right
        var morRightTextures:[SKTexture] = []
        for i in 1...2{
            morRightTextures.append(SKTexture(imageNamed: "MRight\(i)"))
        }
        morRight = SKAction.animate(with: morRightTextures, timePerFrame: 0.25)
        
        playerMor.run(
            SKAction.group([
                SKAction.repeatForever(
                    SKAction.sequence([
                        SKAction.repeat(morIdle, count: 1),
                        SKAction.repeat(morIdle, count: 1).reversed()
                        ]))]))
    }
    
}
