//
//  SquareShape.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/21.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import UIKit

class SquareShape: Shape {

    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.zero: [(0, 0), (1, 0), (0, 1), (1, 1)],
            Orientation.oneEighty: [(0, 0), (1, 0), (0, 1), (1, 1)],
            Orientation.ninety: [(0, 0), (1, 0), (0, 1), (1, 1)],
            Orientation.twoSeventy: [(0, 0), (1, 0), (0, 1), (1, 1)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.zero:       [blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
            Orientation.oneEighty:  [blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
            Orientation.ninety:     [blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
            Orientation.twoSeventy: [blocks[thirdBlockIdx], blocks[fourthBlockIdx]]
        ]
    }
    
    
}
