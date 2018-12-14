//
//  Block.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/14.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import Foundation
import SpriteKit

let numberOfColors: UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    var description: String {
        return self.spriteName
    }
    
    case blue = 0, orange, purple, red, teal, yellow
    
    var spriteName: String {
        switch self {
        case .blue:
            return "blue"
        case .orange:
            return "orange"
        case .purple:
            return "purple"
        case .red:
            return "red"
        case .teal:
            return "teal"
        case .yellow:
            return "yellow"
        }
    }
 
    static func random() -> BlockColor {
        return BlockColor(rawValue: Int(arc4random_uniform(numberOfColors))) ?? .blue
    }
}


class Block: Hashable, CustomStringConvertible {
    let color: BlockColor
    
    var column: Int
    var row: Int
    
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.spriteName
    }
    
    var hashValue: Int {
        return self.column * self.row
    }
    
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column: Int, row: Int, color: BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
    
    
}

func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}
