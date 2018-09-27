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
    let background: SKSpriteNode
    
    //Characters
    let playerRam: SKSpriteNode
    
    
    init(inThisScene: GameScene){
        
        //Init Background
        background = SKSpriteNode.init(imageNamed: "background")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        background.size = CGSize(width: inThisScene.size.width, height: inThisScene.size.width)
        
        //Init Character Ramstey
        playerRam = SKSpriteNode(imageNamed: "RIdle1")
        playerRam.zPosition = 1
        playerRam.position = CGPoint(
            x: (inThisScene.size.width * (((785 + (playerRam.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height/2)
        )
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
                        ])
                )
                ])
        )
    }
    
}
