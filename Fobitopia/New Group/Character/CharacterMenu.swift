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
    
    //Scale
    var scaleA = true
    
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
            if (item.name == "back"){
                gameViewController.skView.presentScene(gameViewController.mainScene, transition: transition)
            }
            
            if(item.name == "ramstey" && scaleA == true){
                characterControls.playerRam.run(SKAction.scale(by: 1.2, duration: 0.01))
                scaleA = false
            }
            
            if(item.name == "morgan" && scaleA == true){
                characterControls.playerMor.run(SKAction.scale(by: 1.2, duration: 0.01))
                scaleA = false
            }
            
            if(item.name == "zenda" && scaleA == true){
                characterControls.playerZen.run(SKAction.scale(by: 1.2, duration: 0.01))
                scaleA = false
            }
            
        }
    }
    
}
