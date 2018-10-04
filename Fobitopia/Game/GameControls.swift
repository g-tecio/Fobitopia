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
    
    //Dialogs box
    let dialogRam: SKSpriteNode
    let dialogMor: SKSpriteNode
    
    //Return Button
    let returnButton: SKSpriteNode
    
    //FaceDialog
    let faceRam: SKSpriteNode
    let faceMor: SKSpriteNode
    
    
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
        
        //Return Button
        returnButton = SKSpriteNode.init(imageNamed: "return")
        returnButton.name = "return_button"
        returnButton.zPosition = 10
        returnButton.position = CGPoint(
            x: (inThisScene.size.width * (((60 + (returnButton.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height * (((980 + (returnButton.size.height / 2)) / 1080 ) * 100) / 100)
        )
        
        //Dialog Ram
        dialogRam = SKSpriteNode.init(imageNamed: "dialog")
        dialogRam.name = "dialogRam"
        dialogRam.zPosition = 14
        dialogRam.position = CGPoint(
            x: (inThisScene.size.width * (((960 + (returnButton.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height * (((850 + (returnButton.size.height / 2)) / 1080 ) * 100) / 100)
        )
        dialogRam.size = CGSize(
            
            width: (dialogRam.size.width * (inThisScene.size.width / dialogRam.size.width)*(((dialogRam.size.width/1920)*200)/100)),
            
            height: (dialogRam.size.height * (inThisScene.size.height / dialogRam.size.height)*(((dialogRam.size.height/1080)*200)/100)))
        
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
        
        
        
        //FaceDialog Ramstey
        faceRam = SKSpriteNode(imageNamed: "RFaceC")
        faceRam.name = "faceRam"
        faceRam.zPosition = 15
        faceRam.position = CGPoint(
            x: (inThisScene.size.width * (((300 + (faceRam.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height * (((850 + (returnButton.size.height / 2)) / 1080 ) * 100) / 100)
        )
        faceRam.size = CGSize(
            
            width: (faceRam.size.width * (inThisScene.size.width / faceRam.size.width)*(((faceRam.size.width/1920)*200)/100)),
            
            height: (dialogRam.size.height * (inThisScene.size.height / faceRam.size.height)*(((faceRam.size.height/1080)*200)/100)))
        
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
        
        //DialogMorg
        dialogMor = SKSpriteNode.init(imageNamed: "dialog")
        dialogMor.name = "dialogMorn"
        dialogMor.zPosition = 14
        dialogMor.position = CGPoint(
            x: (inThisScene.size.width * (((960 + (returnButton.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height * (((850 + (returnButton.size.height / 2)) / 1080 ) * 100) / 100)
        )
        dialogMor.size = CGSize(
            
            width: (dialogMor.size.width * (inThisScene.size.width / dialogMor.size.width)*(((dialogMor.size.width/1920)*200)/100)),
            
            height: (dialogMor.size.height * (inThisScene.size.height / dialogMor.size.height)*(((dialogMor.size.height/1080)*200)/100)))
        
        
        //Facedialog Morgan
        faceMor = SKSpriteNode(imageNamed: "MFaceC")
        faceMor.name = "faceRam"
        faceMor.zPosition = 15
        faceMor.position = CGPoint(
            x: (inThisScene.size.width * (((300 + (faceMor.size.width / 2)) / 1920 ) * 100) / 100),
            y: (inThisScene.size.height * (((850 + (faceMor.size.height / 2)) / 1080 ) * 100) / 100)
        )
        faceMor.size = CGSize(
            
            width: (faceMor.size.width * (inThisScene.size.width / faceMor.size.width)*(((faceMor.size.width/1920)*200)/100)),
            
            height: (faceMor.size.height * (inThisScene.size.height / faceMor.size.height)*(((faceMor.size.height/1080)*200)/100)))
        
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
