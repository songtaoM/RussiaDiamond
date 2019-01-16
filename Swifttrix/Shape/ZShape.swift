//
//  ZShape.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/21.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import UIKit

class ZShape: Shape {
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.zero:       [(1, 0), (1, 1), (0, 1), (0, 2)],
            Orientation.ninety:     [(-1,0), (0, 0), (0, 1), (1, 1)],
            Orientation.oneEighty:  [(1, 0), (1, 1), (0, 1), (0, 2)],
            Orientation.twoSeventy: [(-1,0), (0, 0), (0, 1), (1, 1)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.zero:       [blocks[secondBlockIdx], blocks[fourthBlockIdx]],
            Orientation.ninety:     [blocks[firstBlockIdx], blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
            Orientation.oneEighty:  [blocks[secondBlockIdx], blocks[fourthBlockIdx]],
            Orientation.twoSeventy: [blocks[firstBlockIdx], blocks[thirdBlockIdx], blocks[fourthBlockIdx]]
        ]
    }
}
