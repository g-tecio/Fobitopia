//
//  MenuScene.swift
//  Fobitopia
//
//  Created by Antonio Sein Jagou on 9/26/18.
//  Copyright © 2018 Diego Aragon. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation



class MenuScene: SKScene {
    
    //Sounds
    var playBtn = AVAudioPlayer()
    var chaBtn = AVAudioPlayer()
    //Scale
    var scaleA = true
    
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
        
        do{
            playBtn = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Scream Sound Effect", ofType: "mp3")!))
            playBtn.prepareToPlay()
            
            chaBtn = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "torpedo", ofType: "mp3")!))
        }
        catch{
            print(error)
        }
        
        
        
        
        //Present Label and button
        self.addChild(menuControls.background)
        self.addChild(menuControls.playButton)
        self.addChild(menuControls.characterButton)
        
        menuControls.characterButton.isHidden = false
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
                //  menuControls.characterButton.run(SKAction.scale(by: 5.0, duration: 0.01))
                menuControls.characterButton.isHidden = true
                scaleA = false
                chaBtn.play()
                let transition = SKTransition.doorway(withDuration: 1)
                gameViewController.skView.presentScene(gameViewController.characterMenu, transition: transition)
            }else if (item.name == "play"){
                menuControls.playButton.isHidden = true
                scaleA = false
                chaBtn.play()
                let transition = SKTransition.crossFade(withDuration: 1)
                gameViewController.skView.presentScene(gameViewController.gameScene, transition: transition)
        }
            

            
        }
    }
}
