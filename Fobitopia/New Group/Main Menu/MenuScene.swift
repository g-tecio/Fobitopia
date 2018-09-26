//
//  MenuScene.swift
//  Fobitopia
//
//  Created by Antonio Sein Jagou on 9/26/18.
//  Copyright © 2018 Diego Aragon. All rights reserved.
//

import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    
    var gameViewController: GameViewController!
    
    //Menu Controls
    
    var menuControls: MenuControls!
    
    private var lastUpdateTime : TimeInterval = 0
    
    //Custom Initializer
    init(sceneSize: CGSize, referenceGVC: GameViewController){
        
        //Set reference of GameViewControl
        gameViewController = referenceGVC
        
        //Create scene from code
        super.init(size: sceneSize)
        
        //Menu Controls
        menuControls = MenuControls.init(inThisScene: self)
        
        //Load scene
        if let skView = gameViewController.view as! SKView? {
            
            self.size = skView.bounds.size
            self.scaleMode = .fill
            
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Present Elements
    override func didMove(to view: SKView) {
        //Present Label and button
        self.addChild(menuControls.background)
        self.addChild(menuControls.playButton)
        self.addChild(menuControls.characterButton)
    }
    
    //Before another Scence will be presented
    override func willMove(from view: SKView) {
        removeAllChildren()
    }
    //Touch event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let item = atPoint(location)
            
            if (item.name == "character") {
                gameViewController.skView.presentScene(gameViewController.characterMenu)
            }
            

            
        }
    }
}
