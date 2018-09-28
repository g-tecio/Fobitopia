//
//  CharacterControls.swift
//  Fobitopia
//
//  Created by Diego Aragon on 25/09/18.
//  Copyright © 2018 Diego Aragon. All rights reserved.
//

import SpriteKit

struct  CharacterControls {
    
    let playButton: SKSpriteNode
    let backButton: SKSpriteNode
    let background: SKSpriteNode
    let playerRam: SKSpriteNode
    let playerZen: SKSpriteNode
    let playerMor: SKSpriteNode
    let NameRam: SKSpriteNode
    let NameZen: SKSpriteNode
    let NameMor: SKSpriteNode
    
    
    init(inThisScene: CharacterMenu) {
        
        //background
        background = SKSpriteNode(imageNamed: "characters-menu")
        background.position = CGPoint(x: inThisScene.size.width/2, y: inThisScene.size.height/2)
        background.zPosition = -10
        background.size = CGSize(width: inThisScene.size.width, height: inThisScene.size.height)
       
        //Return menu
        playButton = SKSpriteNode(imageNamed: "btn-play")
        playButton.name = "play"
        playButton.zPosition = -9
        
        playButton.position = CGPoint(
            x: (inThisScene.size.width * (100 - ( (124 + (playButton.size.width / 2)) / 1920 ) * 100) / 100),
            //x: (inThisScene.size.width  * 10/100),
            y: (inThisScene.size.height * (((118 + (playButton.size.height / 2)) / 1080 ) * 100) / 100)
        )
        
        playButton.size =  CGSize(
            width: (playButton.size.width * (inThisScene.size.width / playButton.size.width)*(((playButton.size.width/1920)*100)/100)),
            height: (playButton.size.height * (inThisScene.size.height / playButton.size.height)*(((playButton.size.height/1080)*100)/100))
        )
        

        
        
        //Start game
        backButton = SKSpriteNode(imageNamed: "btn-back")
        backButton.name = "back"
        backButton.zPosition = -9
        
        backButton.position = CGPoint(
            x: (inThisScene.size.width * (((124 + (backButton.size.width / 2)) / 1920 ) * 100) / 100),
            //x: (inThisScene.size.width  * 90/100),
            y: (inThisScene.size.height * (((118 + (backButton.size.height / 2)) / 1080 ) * 100) / 100)
        )
        
        backButton.size = CGSize(
            width: (backButton.size.width * (inThisScene.size.width / backButton.size.width)*(((backButton.size.width/1920)*100)/100)),
            height: (backButton.size.height * (inThisScene.size.height / backButton.size.height)*(((backButton.size.height/1080)*100)/100))
        )

        
        
        playerRam = SKSpriteNode(imageNamed: "Ram0")
        playerRam.name = "ramstey"
        playerRam.zPosition = 1
        playerRam.position = CGPoint(
            x: (inThisScene.size.width * (((785 + (playerRam.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height/2)
        )
        playerRam.size = CGSize(
            width: (playerRam.size.width * (inThisScene.size.width / playerRam.size.width)*(((playerRam.size.width/1920)*100)/100)),
            height: (playerRam.size.height * (inThisScene.size.height / playerRam.size.height)*(((playerRam.size.height/1080)*100)/100))
        )
        
        
        //Name
        NameRam = SKSpriteNode(imageNamed: "RName")
        NameRam.zPosition = 10
        NameRam.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*(30.20/100)))
        
        NameRam.size = CGSize(
            
            width: (NameRam.size.width * (inThisScene.size.width / NameRam.size.width)*(((NameRam.size.width/1920)*200)/100)),
            
            height: (NameRam.size.height * (inThisScene.size.height / NameRam.size.height)*(((NameRam.size.height/1080)*200)/100)))
        
        
        
        var textures:[SKTexture] = []
        for i in 0...4{
            textures.append(SKTexture(imageNamed: "Ram\(i)"))
        }
        
        var RamAnima:SKAction
        RamAnima = SKAction.animate(with: textures, timePerFrame: 0.09)
        playerRam.run(
            SKAction.group([
                SKAction.repeatForever(
                    SKAction.sequence([
                        SKAction.repeat(RamAnima, count: 1),
                        SKAction.repeat(RamAnima, count: 1).reversed()
                    ])
                )
            ])
        )
        
        playerZen = SKSpriteNode(imageNamed: "Zenda0")
       
        playerZen.name = "zenda"
        playerZen.zPosition = 1
        playerZen.position = CGPoint(
            x: (inThisScene.size.width * (((1463 + (playerZen.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height/2)
        )
        playerZen.size = CGSize(
            width: (playerZen.size.width * (inThisScene.size.width / playerZen.size.width)*(((playerZen.size.width/1920)*100)/100)),
            height: (playerZen.size.height * (inThisScene.size.height / playerZen.size.height)*(((playerZen.size.height/1080)*100)/100))
        )
        
        //Name
        NameZen = SKSpriteNode(imageNamed: "ZName")
        NameZen.zPosition = 11
        NameZen.position = CGPoint(x: inThisScene.size.width*(85/100), y: (inThisScene.size.height*(30.20/100)))
        
        NameZen.size = CGSize(
            
            width: (NameZen.size.width * (inThisScene.size.width / NameZen.size.width)*(((NameZen.size.width/1920)*200)/100)),
            
            height: (NameZen.size.height * (inThisScene.size.height / NameZen.size.height)*(((NameZen.size.height/1080)*200)/100)))
        
        
        
        
        
        var textures1:[SKTexture] = []
        for i in 0...3{
            textures1.append(SKTexture(imageNamed: "Zenda\(i)"))
        }
        
        var ZenAnima:SKAction
        ZenAnima = SKAction.animate(with: textures1, timePerFrame: 0.10)
        playerZen.run(
            SKAction.group([
                SKAction.repeatForever(
                    SKAction.sequence([
                        SKAction.repeat(ZenAnima, count: 1),
                        SKAction.repeat(ZenAnima, count: 1).reversed()
                    ])
                )
            ])
        )
        
        playerMor = SKSpriteNode(imageNamed: "Morgan0")
        playerMor.name = "morgan"
        playerMor.zPosition = 1
        playerMor.position = CGPoint(
            x: (inThisScene.size.width * (((107 + (playerMor.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height/2)
        )
        playerMor.size = CGSize(
            width: (playerMor.size.width * (inThisScene.size.width / playerMor.size.width)*(((playerMor.size.width/1920)*100)/100)),
            height: (playerMor.size.height * (inThisScene.size.height / playerMor.size.height)*(((playerMor.size.height/1080)*100)/100))
        )
        
        //Name
        NameMor = SKSpriteNode(imageNamed: "MName")
        NameMor.zPosition = 12
        NameMor.position = CGPoint(x: inThisScene.size.width*(15/100), y: (inThisScene.size.height*(30.20/100)))
        
        NameMor.size = CGSize(
            
            width: (NameMor.size.width * (inThisScene.size.width / NameMor.size.width)*(((NameMor.size.width/1920)*200)/100)),
            
            height: (NameMor.size.height * (inThisScene.size.height / NameMor.size.height)*(((NameMor.size.height/1080)*200)/100)))
        
        var textures2:[SKTexture] = []
        for i in 0...4{
            textures2.append(SKTexture(imageNamed: "Morgan\(i)"))
        }
        
        var MorAnima:SKAction
        MorAnima = SKAction.animate(with: textures2, timePerFrame: 0.12)
        playerMor.run(
            SKAction.group([
                SKAction.repeatForever(
                    SKAction.sequence([
                        SKAction.repeat(MorAnima, count: 1),
                        SKAction.repeat(MorAnima, count: 1).reversed()
                    ])
                )
            ])
        )
        
    
    }
    
}
