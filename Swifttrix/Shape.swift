//
//  Shape.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/14.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import UIKit
import SpriteKit


//The object of art is to give life shape


let numOrientations: UInt32 = 4


enum Orientation: Int, CustomStringConvertible {
    case zero = 0, ninety, oneEighty, twoSeventy
    
    var description: String {
        switch self {
        case .zero:
            return "0"
        case .ninety:
            return "90"
        case .oneEighty:
            return "180"
        case .twoSeventy:
            return "270"
        }
    }
    
    static func random() -> Orientation {
        return Orientation(rawValue: Int(arc4random_uniform(numOrientations))) ?? .zero
    }
    
    static func rotate(orientation: Orientation, clockwise: Bool) -> Orientation {
        var rotated = orientation.rawValue + (clockwise ? 1 : -1)
        if rotated > Orientation.twoSeventy.rawValue {
            rotated = Orientation.zero.rawValue
        } else if rotated < 0 {
            rotated = Orientation.twoSeventy.rawValue
        }
        return Orientation(rawValue: rotated)
    }
    
}


let numOfShapes: UInt32 = 7

let firstBlockIdx: Int = 0
let secondBlockIdx: Int = 1
let thirdBlockIdx: Int = 2
let fourthBlockIdx: Int = 3


class Shape: Hashable, CustomStringConvertible {
    
    let color: BlockColor
    var blocks = Array<Block>()
    var orientation: Orientation
    var column, row: Int
    
    
    var blockRowColumnPosition
    
    

}
