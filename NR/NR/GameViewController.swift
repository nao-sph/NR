//
//  GameViewController.swift
//  NR
//
//  Created by NagaiNaoki on 2017/08/15.
//  Copyright © 2017年 NoR. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                //scene.scaleMode = .aspectFill
                scene.scaleMode = .resizeFill
                    
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    //MARK: Action
   
    @IBAction func ToSelect(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Select", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "next") as! SelectViewController
        self.present(nextView, animated: true, completion: nil)
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
