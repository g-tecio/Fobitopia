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
    //Scale
    var scaleA = true
    var isTouchRam = false
    var isTouchZen = false
    var isTouchMor = false
    
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
            let transition2 = SKTransition.crossFade(withDuration: 1)
            if (item.name == "back"){
                gameViewController.skView.presentScene(gameViewController.mainScene, transition: transition)
            }else if (item.name == "play"){
                gameViewController.skView.presentScene(gameViewController.gameScene, transition: transition2)
            }
            
            if(item.name == "ramstey" && isTouchRam == false){
                isTouchZen = false
                isTouchMor = false
                isTouchRam = true
                characterControls.playerRam.run(SKAction.scale(by: 1.5, duration: 0.35))
                characterControls.playerRam.run(blinkAnimation())
                scaleA = false
                if (selection == 2) {
                    characterControls.playerMor.run(SKAction.scale(by: 0.5, duration: 0.35))
                }else if (selection == 3){
                    characterControls.playerZen.run(SKAction.scale(by: 0.9, duration: 0.35))
                }
                selection = 1
                scaleA = true

            }
            
            if(item.name == "morgan" && isTouchMor == false ){
                isTouchZen = false
                isTouchMor = true
                isTouchRam = false
                characterControls.playerMor.run(SKAction.scale(by: 1.5, duration: 0.35))
                characterControls.playerMor.run(blinkAnimation())
                scaleA = false
                if (selection == 1) {
                    characterControls.playerRam.run(SKAction.scale(by: 0.5, duration: 0.35))
                }else if (selection == 3){
                    characterControls.playerZen.run(SKAction.scale(by: 0.5, duration: 0.35))
                }
                selection = 2
                scaleA = true
            }
            
            if(item.name == "zenda" && isTouchZen == false){
                isTouchZen = true
                isTouchMor = false
                isTouchRam = false
                characterControls.playerZen.run(SKAction.scale(by: 1.5, duration: 0.35))
                characterControls.playerZen.run(blinkAnimation())
                scaleA = false
                if (selection == 1) {
                    characterControls.playerRam.run(SKAction.scale(by: 0.5, duration: 0.35))
                }else if (selection == 2){
                    characterControls.playerMor.run(SKAction.scale(by: 0.5, duration: 0.35))
                }
                selection = 3
                scaleA = true
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
