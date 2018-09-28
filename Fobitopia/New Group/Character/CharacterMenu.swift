//
//  CharacterMenu.swift
//  Fobitopia
//
//  Created by Diego Aragon on 25/09/18.
//  Copyright © 2018 Diego Aragon. All rights reserved.
//

import Foundation
import SpriteKit

class CharacterMenu: SKScene {
    
    var gameViewController: GameViewController!
    var menuControls: MenuControls!
    var characterControls: CharacterControls!
    var selection = 0
    
    
    init(sceneSize: CGSize, referenceGVC: GameViewController) {
        
        /// Set reference of GameViewControl
        gameViewController = referenceGVC
        
        /// Create scene from code
        super.init(size: sceneSize)
        
        /// Menu Controls
        characterControls = CharacterControls.init(inThisScene: self)

        
        /// Load scene
        if let skView = gameViewController.view as! SKView? {
            
            self.size = skView.bounds.size
            self.scaleMode = .fill
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.addChild(characterControls.background)
        self.addChild(characterControls.playButton)
        self.addChild(characterControls.backButton)
        self.addChild(characterControls.playerRam)
        self.addChild(characterControls.playerZen)
        self.addChild(characterControls.playerMor)
        self.addChild(characterControls.NameRam)
        self.addChild(characterControls.NameMor)
        self.addChild(characterControls.NameZen)
    }
    
    //Before another scence will be presented
    override func willMove(from view: SKView) {
        removeAllChildren()
    }
    
    //Touch Event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {

            let location = touch.location(in: self)
            let item = atPoint(location)
            let transition = SKTransition.crossFade(withDuration: 0.5)
            let transition2 = SKTransition.crossFade(withDuration: 1)
            if (item.name == "back"){
                gameViewController.skView.presentScene(gameViewController.mainScene, transition: transition)
            }else if (item.name == "play"){
                gameViewController.skView.presentScene(gameViewController.gameScene, transition: transition2)
            }
            
            if(item.name == "ramstey"){
                    characterControls.playerRam.run(blinkAnimation())
            }
            
            if(item.name == "morgan"){
                characterControls.playerMor.run(blinkAnimation())
            }
            if(item.name == "zenda"){
                characterControls.playerZen.run(blinkAnimation())
            }
            
            
        }
    }
    
    func blinkAnimation() -> SKAction{
        let duration = 0.1
        let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: TimeInterval(duration))
        let fadeIn = SKAction.fadeAlpha(to: 2.0, duration: duration)
        let blink = SKAction.sequence([fadeOut, fadeIn])
        return SKAction.repeat(blink, count: 8)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
