//
//  GameViewController.swift
//  Fobitopia
//
//  Created by Diego Aragon on 25/09/18.
//  Copyright © 2018 Diego Aragon. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    let skView = SKView()
    
    var sceneStateMachine: GKStateMachine!
    
    //Scenes
    var mainScene: MenuScene!
    var characterMenu: CharacterMenu!

    override func viewDidLoad() {
        skView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        skView.center = self.view.center
        skView.contentMode = .scaleAspectFill
        skView.allowsTransparency = true
        
        super.viewDidLoad()
        
        //MenuScene Setup
        mainScene = MenuScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        //Character Menu Setup
        characterMenu = CharacterMenu.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        skView.presentScene(mainScene)
        view.addSubview(skView)
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
