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
    
    var bgSoundPlayer:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
      
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.playBackgroundSound(_:)), name: NSNotification.Name(rawValue: "PlayBackgroundSound"), object: nil) //add this to play audio
            
            
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.stopBackgroundSound), name: NSNotification.Name(rawValue: "StopBackgroundSound"), object: nil) //add this to stop the audio
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    @objc func playBackgroundSound(_ notification: Notification) {
        
        //get the name of the file to play from the data passed in with the notification
        let name = (notification as NSNotification).userInfo!["music"] as! String
        
        
        //if the bgSoundPlayer already exists, stop it and make it nil again
        if (bgSoundPlayer != nil){
            
            bgSoundPlayer!.stop()
            bgSoundPlayer = nil
            
            
        }
        
        //as long as name has at least some value, proceed...
        if (name != ""){
            
            //create a URL variable using the name variable and tacking on the "mp3" extension
            let fileURL:URL = Bundle.main.url(forResource:name, withExtension: "mp3")!
            
            //basically, try to initialize the bgSoundPlayer with the contents of the URL
            do {
                bgSoundPlayer = try AVAudioPlayer(contentsOf: fileURL)
            } catch _{
                bgSoundPlayer = nil
                
            }
            
            bgSoundPlayer!.volume = 0.75 //set the volume anywhere from 0 to 1
            bgSoundPlayer!.numberOfLoops = -1 // -1 makes the player loop forever
            bgSoundPlayer!.prepareToPlay() //prepare for playback by preloading its buffers.
            bgSoundPlayer!.play() //actually play
            
        }
        
        
    }
    
    
    
    @objc func stopBackgroundSound() {
        
        //if the bgSoundPlayer isn't nil, then stop it
        if (bgSoundPlayer != nil){
            
            bgSoundPlayer!.stop()
            bgSoundPlayer = nil
            
            
        }
        
    }
}
