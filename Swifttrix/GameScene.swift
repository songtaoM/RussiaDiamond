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

let blockSize: CGFloat = 20.0

class GameScene: SKScene {
    
    
    var tick: (() -> ())?
    var tickLengthMillis = tickLengthLevelOne
    var lastTick: Date?
    
    let gameLayer = SKNode()
    let shapeLayer = SKNode()
    let layerPosition = CGPoint(x: 6, y: -6)
    
    var textureCache = Dictionary<String, SKTexture>()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    
    
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0, y: 1.0)
        let background = SKSpriteNode(imageNamed: "background")
        background.position = .zero
        background.anchorPoint = anchorPoint
        addChild(background)
        addChild(gameLayer)
        
        let gameBoardTexture = SKTexture(imageNamed: "gameboard")
        let gameBoard = SKSpriteNode(texture: gameBoardTexture, size: CGSize(width: blockSize * CGFloat(numColumns), height: blockSize * CGFloat(numRows)))
        gameBoard.anchorPoint = CGPoint(x: 0, y: 1)
        gameBoard.position = layerPosition
        
        shapeLayer.position = layerPosition
        shapeLayer.addChild(gameBoard)
        gameLayer.addChild(shapeLayer)
        
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
    
    
    
    func pointForColumn(column: Int, row: Int) -> CGPoint {
        let x = layerPosition.x + (CGFloat(column) * blockSize) + (blockSize / 2)
        let y = layerPosition.y - ((CGFloat(row) * blockSize) + (blockSize / 2))
        return CGPoint(x: x, y: y)
    }
    
    func addPreviewShapeToScene(shape:Shape, completion:@escaping () -> ()) {
        for block in shape.blocks {
            // #10
            var texture = textureCache[block.spriteName]
            if texture == nil {
                texture = SKTexture(imageNamed: block.spriteName)
                textureCache[block.spriteName] = texture
            }
            let sprite = SKSpriteNode(texture: texture)
            // #11
            sprite.position = pointForColumn(column: block.column, row:block.row - 2)
            shapeLayer.addChild(sprite)
            block.sprite = sprite
            
            // Animation
            sprite.alpha = 0
            // #12
            let moveAction = SKAction.move(to: pointForColumn(column: block.column, row: block.row), duration: TimeInterval(0.2))
            moveAction.timingMode = .easeOut
            let fadeInAction = SKAction.fadeAlpha(to: 0.7, duration: 0.4)
            fadeInAction.timingMode = .easeOut
            sprite.run(SKAction.group([moveAction, fadeInAction]))
        }
        run(SKAction.wait(forDuration: 0.4), completion: completion)
    }
    
    func movePreviewShape(shape:Shape, completion:@escaping () -> ()) {
        for block in shape.blocks {
            let sprite = block.sprite!
            let moveTo = pointForColumn(column: block.column, row:block.row)
            let moveToAction:SKAction = SKAction.move(to: moveTo, duration: 0.2)
            moveToAction.timingMode = .easeOut
            sprite.run(
                SKAction.group([moveToAction, SKAction.fadeAlpha(to: 1.0, duration: 0.2)]), completion: {})
        }
        run(SKAction.wait(forDuration: 0.2), completion: completion)
    }
    
    func redrawShape(shape:Shape, completion:@escaping () -> ()) {
        for block in shape.blocks {
            let sprite = block.sprite!
            let moveTo = pointForColumn(column: block.column, row:block.row)
            let moveToAction:SKAction = SKAction.move(to: moveTo, duration: 0.05)
            moveToAction.timingMode = .easeOut
            if block == shape.blocks.last {
                sprite.run(moveToAction, completion: completion)
            } else {
                sprite.run(moveToAction)
            }
        }
    }
}

    

