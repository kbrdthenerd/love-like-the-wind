//
//  Floor.swift
//  LoveLikeTheWind
//
//  Created by Katherine Brennan on 1/27/18.
//  Copyright © 2018 Katherine Brennan. All rights reserved.
//

import Foundation
import SpriteKit

class Floor: SKNode {
    override init() {
         super.init()
        
        self.position = CGPoint(x:0, y: -UIScreen.main.bounds.height / 2)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: UIScreen.main.bounds.width * 2, height: 20))
        
        self.physicsBody?.isDynamic = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
