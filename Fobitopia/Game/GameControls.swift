//
//  GameControls.swift
//  Fobitopia
//
//  Created by Ismael Serrano on 9/27/18.
//  Copyright © 2018 Diego Aragon. All rights reserved.
//
import SpriteKit

struct GameControls {
    
    //Background
    let house: SKSpriteNode
    
    //Characters
    let playerRam: SKSpriteNode
    
    
    init(inThisScene: GameScene){
        
        //Init Background
        house = SKSpriteNode.init(imageNamed: "house1")
        house.name = "house"
        house.zPosition = 0
        house.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        house.size = CGSize(width: inThisScene.size.width, height: inThisScene.size.width)
        
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
        playerRam.zPosition = 1
        playerRam.position = CGPoint(
            x: (inThisScene.size.width * (((785 + (playerRam.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height/2)
        )
        playerRam.physicsBody = SKPhysicsBody(rectangleOf: playerRam.size)
        playerRam.physicsBody?.isDynamic = false
        playerRam.physicsBody?.friction = 0
        playerRam.physicsBody?.restitution = 1
        playerRam.size = CGSize(
            width: (playerRam.size.width * (inThisScene.size.width / playerRam.size.width)*(((playerRam.size.width/1920)*100)/100)),
            height: (playerRam.size.height * (inThisScene.size.height / playerRam.size.height)*(((playerRam.size.height/1080)*100)/100))
        )
        //Idle Animation
        var ramIdleTextures:[SKTexture] = []
        for i in 1...2{
            ramIdleTextures.append(SKTexture(imageNamed: "RIdle\(i)"))
        }
        var ramIdle:SKAction
        ramIdle = SKAction.animate(with: ramIdleTextures, timePerFrame: 0.25)
        
      
        
        
        playerRam.run(
            SKAction.group([
                SKAction.repeatForever(
                    SKAction.sequence([
                        SKAction.repeat(ramIdle, count: 1),
                        SKAction.repeat(ramIdle, count: 1).reversed()
                        ]))]))
    }
    
}
