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
    
    //textLabel
    let ramLabel = SKLabelNode(fontNamed: "Snake Jacket")
    
    var personaje: SKSpriteNode!
    var animaLeft: SKAction!
    var animaRight: SKAction!

    var dirX: CGFloat = 0.0
    var playerRam : SKSpriteNode!
 
    var gameViewController: GameViewController!
    //Game Controls
    var gameControls: GameControls!
    var characterControls: CharacterControls!
    
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
    
    func initFont(){
        ramLabel.fontColor = SKColor.red
        ramLabel.fontSize = 50
        ramLabel.zPosition = 100
        ramLabel.text = "Time to have fun"
        
        ramLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        ramLabel.position = CGPoint(x: 200, y: frame.size.height - 90 )
        addChild(ramLabel)
        
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveLinear, animations: {
            self.view?.layoutIfNeeded()
        }, completion: {finished in
            print ("Movement letters")
        })
    }

    
    
    override func didMove(to view: SKView) {
        self.addChild(gameControls.house)
        self.addChild(gameControls.returnButton)
        self.addChild(gameControls.dialog)
        self.addChild(gameControls.faceRam)
        initFont()

        //Seleccionar personaje
        switch selectPlayer {
        case 1:
            print("tu personaje es Ramstey")
            self.addChild(gameControls.playerRam)
            personaje = gameControls.playerRam
            animaLeft = gameControls.ramLeft
            animaRight = gameControls.ramRight
            break;
        case 2:
            print("tu personaje es Morgan")
            self.addChild(gameControls.playerMor)
            personaje = gameControls.playerMor
            animaLeft = gameControls.morLeft
            animaRight = gameControls.morRight
            break;
        case 3:
            print("tu personaje es Zenda")
            self.addChild(gameControls.playerRam)
            personaje = gameControls.playerRam
            animaLeft = gameControls.ramLeft
            animaRight = gameControls.ramRight
            break;
        default:
            break;
        }
        //Test
        let player = gameControls.playerRam
        player.physicsBody = SKPhysicsBody.init(rectangleOf: gameControls.playerRam.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.categoryBitMask = playerCategory
        gameControls.borderBody.categoryBitMask = BorderCategory
        player.physicsBody?.contactTestBitMask = BorderCategory | fenceCategory
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let item = atPoint(location)
            let transition2 = SKTransition.crossFade(withDuration: 1.5)
            if (item.name == "dialog"){
                gameControls.dialog.isHidden = true
                gameControls.faceRam.isHidden = true
                ramLabel.isHidden = true
            }
            if (item.name == "return_button"){
                gameViewController.skView.presentScene(gameViewController.mainScene, transition: transition2)
                removeAllChildren()
            }
            if(personaje.position.x > location.x){
                personaje.run(SKAction.scaleX(to: 1, duration: 0.1))
                personaje.run(SKAction.group([
                    SKAction.repeat(
                        SKAction.sequence([
                            SKAction.repeat(animaLeft, count: 1),
                            SKAction.repeat(animaLeft, count: 1).reversed()
                            ]), count: 2
                    )
                    ])
                )
                
                
            }else if(personaje.position.x < location.x){
                personaje.run(SKAction.scaleX(to: 1, duration: 0.1))
                personaje.run(SKAction.group([
                    SKAction.repeat(
                        SKAction.sequence([
                            SKAction.repeat(animaRight, count: 1),
                            SKAction.repeat(animaRight, count: 1).reversed()
                            ]), count: 2
                    )
                    ])
                )
            }
            
            let xDist = (personaje.position.x - location.x)
            let yDist = (personaje.position.y - location.y)
            
            let distance = sqrt((xDist * xDist) + (yDist * yDist))
            
            let speed:CGFloat = 100.0
            let duration: CGFloat = distance/speed
            
            personaje.removeAction(forKey: "moveRamSide")
            
            personaje.run(SKAction.moveTo(x: location.x, duration: TimeInterval(duration)), withKey: "moveRamSide")
        }
        
    }
        

    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    //
}
