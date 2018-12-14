//
//  GameScene.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/13.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation


let tickLengthLevelOne = TimeInterval(600)

class GameScene: SKScene {
    
    
    var tick: (() -> ())?
    var tickLengthMillis = tickLengthLevelOne
    var lastTick: Date?
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    
    
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0, y: 1.0)
        let background = SKSpriteNode(imageNamed: "background")
        background.size = size
        background.position = .zero
        background.anchorPoint = anchorPoint
        addChild(background)
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        guard let lastTick = lastTick else {
            return
        }
        
        let timePassed = lastTick.timeIntervalSinceNow * -1000
        if timePassed > tickLengthMillis {
            self.lastTick = Date()
            tick?()
        }
    }
    
    func startTicking() {
        lastTick = Date()
    }
    
    func stopTicking() {
        lastTick = nil
    }
    
}
