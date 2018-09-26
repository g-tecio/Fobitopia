//
//  MenuControls.swift
//  Fobitopia
//
//  Created by Antonio Sein Jagou on 9/26/18.
//  Copyright © 2018 Diego Aragon. All rights reserved.
//

import SpriteKit

struct MenuControls {
    
    //Background
    let background: SKSpriteNode
    //Play button
    let playButton: SKSpriteNode
    //Character Button
    let characterButton: SKSpriteNode
    
    init(inThisScene: MenuScene){
        
        background = SKSpriteNode.init(imageNamed: "background")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        background.size = CGSize(width: inThisScene.size.width, height: inThisScene.size.width)
        
        //Play button
        playButton = SKSpriteNode.init(imageNamed: "btn-play")
        playButton.name = "play"
        playButton.zPosition = 2
        playButton.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*(60.20/100)))
        playButton.size = CGSize(
            
            width: (playButton.size.width * (inThisScene.size.width / playButton.size.width)*(((playButton.size.width/1920)*200)/100)),
            
            height: (playButton.size.height * (inThisScene.size.height / playButton.size.height)*(((playButton.size.height/1080)*200)/100)))
        
        
        //Character Button
        
        characterButton = SKSpriteNode.init(imageNamed: "btn-character")
        characterButton.name = "character"
        characterButton.zPosition = 3
        
        characterButton.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*(30.20/100)))
        
        characterButton.size = CGSize(
            
            width: (characterButton.size.width * (inThisScene.size.width / characterButton.size.width)*(((characterButton.size.width/1920)*200)/100)),
            
            height: (characterButton.size.height * (inThisScene.size.height / characterButton.size.height)*(((characterButton.size.height/1080)*200)/100)))

        
        
    }
    
    
}
