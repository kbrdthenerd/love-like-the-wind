import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let swipeUpRec = UISwipeGestureRecognizer()
    let swipeDownRec = UISwipeGestureRecognizer()
    
    
    let right = SKAction.moveBy(x: 64, y: 0, duration: 2)
    let left = SKAction.moveBy(x: -64, y: 0, duration: 2)
    let up = SKAction.moveBy(x: 0, y: 64, duration: 2)
    let down = SKAction.moveBy(x: 0, y: -64, duration: 2)

    
    let player = SKSpriteNode(imageNamed: "sweet_letter")
    let lover1 = SKSpriteNode(imageNamed: "person1")
    let lover2 = SKSpriteNode(imageNamed: "person2")
    var background = SKSpriteNode(imageNamed: "background")
    
    var backgroundMusic: SKAudioNode!
    
    private let backgroundNode = BackgroundNode()

    override func sceneDidLoad() {
        backgroundNode.setup(size: size)
        addChild(backgroundNode)
    }
    
    
    
    override func didMove(to view: SKView) {
      
        if let musicURL = Bundle.main.url(forResource: "music", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
    
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -0.03);
        
        background.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        background.size.width = self.size.width
        background.size.height = self.size.height
        background.zPosition = -1;
        self.addChild(background)
        
        player.setScale(0.1)
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        self.addChild(player)
        
        lover1.setScale(0.12)
        lover1.position = CGPoint(x: size.width * 0.05, y: size.height * 0.25)
        self.addChild(lover1)
        
    
        lover2.setScale(0.12)
        lover2.position = CGPoint(x: size.width * 0.96, y: size.height * 0.20)
        self.addChild(lover2)

        
        
        
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
        
        
    }
    
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
    
}
