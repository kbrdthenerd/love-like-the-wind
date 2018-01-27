import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //First we declare all of our Gestures...
    
    //swipes
    
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let swipeUpRec = UISwipeGestureRecognizer()
    let swipeDownRec = UISwipeGestureRecognizer()
    
    
    let right = SKAction.moveBy(x: 64, y: 0, duration: 2)
    let left = SKAction.moveBy(x: -64, y: 0, duration: 2)
    let up = SKAction.moveBy(x: 0, y: 64, duration: 2)
    let down = SKAction.moveBy(x: 0, y: -64, duration: 2)
    
    //rotate
    
    let rotateRec = UIRotationGestureRecognizer()
    
    //taps
    
    let tapRec = UITapGestureRecognizer()
    let tapRec2 = UITapGestureRecognizer()
    let player = SKSpriteNode(imageNamed: "sweet_letter")

    
    
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.blue
        // 3
        player.setScale(0.1)
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        // 4
        addChild(player)

        
        
        
        swipeRightRec.addTarget(self, action: #selector(GameScene.swipedRight) )
        swipeRightRec.direction = .right
        self.view!.addGestureRecognizer(swipeRightRec)
        
        swipeLeftRec.addTarget(self, action: #selector(GameScene.swipedLeft) )
        swipeLeftRec.direction = .left
        self.view!.addGestureRecognizer(swipeLeftRec)
        
        
        swipeUpRec.addTarget(self, action: #selector(GameScene.swipedUp) )
        swipeUpRec.direction = .up
        self.view!.addGestureRecognizer(swipeUpRec)
        
        swipeDownRec.addTarget(self, action: #selector(GameScene.swipedDown) )
        swipeDownRec.direction = .down
        self.view!.addGestureRecognizer(swipeDownRec)
        
        //notice the function this calls has (_:) after it because we are passing in info about the gesture itself (the sender)
        
        rotateRec.addTarget(self, action: #selector (GameScene.rotatedView (_:) ))
        self.view!.addGestureRecognizer(rotateRec)
        
        
        // again notice (_:), we'll need this to find out where the tap occurred.
        
        tapRec.addTarget(self, action:#selector(GameScene.tappedView(_:) ))
        tapRec.numberOfTouchesRequired = 1
        tapRec.numberOfTapsRequired = 1
        self.view!.addGestureRecognizer(tapRec)
        
        
        tapRec2.addTarget(self, action:#selector(GameScene.tappedView2(_:) ))
        tapRec2.numberOfTouchesRequired = 1
        tapRec2.numberOfTapsRequired = 2  //2 taps instead of 1 this time
        self.view!.addGestureRecognizer(tapRec2)
        
        
        
        
        
    }
    
    //the functions that get called when swiping...
    
    @objc func swipedRight() {
        player.run(right)
        print("Right")
        
    }
    
    @objc func swipedLeft() {
        player.run(left)

        print("Left")
    }
    
    @objc func swipedUp() {
        player.run(up)

        print("Up")
    }
    
    @objc func swipedDown() {
        player.run(down)

        print("Down")
    }
    
    
    // what gets called when there's a single tap...
    
    //notice the sender is a parameter. This is why we added (_:) that part to the selector earlier
    
    @objc func tappedView(_ sender:UITapGestureRecognizer) {
        
        let point:CGPoint = sender.location(in: self.view)
        
        print("Single tap")
        
        print(point)
        
    }
    
    // what gets called when there's a double tap...
    
    //notice the sender is a parameter. This is why we added (_:) that part to the selector earlier
    
    @objc func tappedView2(_ sender:UITapGestureRecognizer) {
        
        let point:CGPoint = sender.location(in: self.view)
        
        print("Double tap")
        
        print(point)
        
    }
    
    //what gets called when there's a rotation gesture
    //notice the sender is a parameter. This is why we added (_:) that part to the selector earlier
    
    @objc func rotatedView(_ sender:UIRotationGestureRecognizer) {
        
        if (sender.state == .began) {
            
            print("rotation began")
            
        }
        if (sender.state == .changed) {
            
            print("rotation changed")
            
            //you could easily make any sprite's rotation equal this amount like so...
            //thePlayer.zRotation = -sender.rotation
            
            //convert rotation to degrees...
            let rotateAmount = Measurement(value: Double(sender.rotation), unit: UnitAngle.radians).converted(to: .degrees).value
            
            print("\(rotateAmount) degreess" )
            
            
            
        }
        if (sender.state == .ended) {
            
            print("rotation ended")
            
            
        }
        
        
    }
    
    func removeAllGestures(){
        
        //if you need to remove all gesture recognizers with Swift you can do this....
        
        for gesture in (self.view?.gestureRecognizers)! {
            
            self.view?.removeGestureRecognizer(gesture)
        }
        
        //this is good to do before a SKScene transitions to another SKScene.
        
        
    }
    func removeAGesture()
    {
        
        //To remove a single gesture you can use...
        
        self.view?.removeGestureRecognizer(swipeUpRec)
    }
    
}
