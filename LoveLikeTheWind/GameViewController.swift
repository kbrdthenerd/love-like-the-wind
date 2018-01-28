//
//  GameViewController.swift
//  GameJam2018
//
//  Created by Katherine Brennan on 1/26/18.
//  Copyright © 2018 Katherine Brennan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    override func preferredScreenEdgesDeferringSystemGestures() -> UIRectEdge {
        return .bottom
    }
    
    

}
