//
//  GameViewController.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/13.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController, SwiftTrisDelegate {

     var panPointReference:CGPoint?

    
    var scene: GameScene!
    var swiftris:SwiftTris!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let v = view as! SKView? {
            v.isMultipleTouchEnabled = false
            scene = GameScene(size: UIScreen.main.bounds.size)
            scene.scaleMode = .fill
            scene.tick = didTick
            
            swiftris = SwiftTris()
            swiftris.delegate = self
            swiftris.beginGame()
            v.presentScene(scene)
        }
    }
    
    @IBAction func tap(_ sender: Any) {
        swiftris.rotateShape()
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        // #2
        let currentPoint = sender.translation(in: self.view)
        if let originalPoint = panPointReference {
            // #3
            if abs(currentPoint.x - originalPoint.x) > (blockSize * 0.9) {
                // #4
                if sender.velocity(in: self.view).x > CGFloat(0) {
                    swiftris.moveShapeRight()
                    panPointReference = currentPoint
                } else {
                    swiftris.moveShapeLeft()
                    panPointReference = currentPoint
                }
            }
        } else if sender.state == .began {
            panPointReference = currentPoint
        }
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

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func didTick() {
        swiftris.letShapeFall()
    }
    
    func nextShape() {
        let newShapes = swiftris.newShape()
        guard let fallingShape = newShapes.fallingShape else {
            return
        }
        self.scene.addPreviewShapeToScene(shape: newShapes.nextShape!) {}
        self.scene.movePreviewShape(shape: fallingShape) {
            // #16
            self.view.isUserInteractionEnabled = true
            self.scene.startTicking()
        }
    }
    
    func gameDidBegin(swiftTris: SwiftTris) {
        // The following is false when restarting a new game
        if swiftris.nextShape != nil && swiftris.nextShape!.blocks[0].sprite == nil {
            scene.addPreviewShapeToScene(shape: swiftris.nextShape!) {
                self.nextShape()
            }
        } else {
            nextShape()
        }
    }
    
    func gameDidEnd(swiftTris: SwiftTris) {
        view.isUserInteractionEnabled = false
        scene.stopTicking()
    }
    
    func gameDidLevelUp(swiftTris: SwiftTris) {
        
    }
    
    func gameShapeDidLand(swiftTris: SwiftTris) {
        scene.stopTicking()
        nextShape()
    }
    
    // #17
    func gameShapeDidMove(swiftTris swiftris: SwiftTris) {
        scene.redrawShape(shape: swiftris.fallingShape!) {}
    }

    func gamgeShapeDidDrop(swiftTris: SwiftTris) {
        
    }
}
