//
//  TShape.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/21.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import UIKit

class TShape: Shape {
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.zero:       [(1, 0), (0, 1), (1, 1), (2, 1)],
            Orientation.ninety:     [(2, 1), (1, 0), (1, 1), (1, 2)],
            Orientation.oneEighty:  [(1, 2), (0, 1), (1, 1), (2, 1)],
            Orientation.twoSeventy: [(0, 1), (1, 0), (1, 1), (1, 2)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.zero:       [blocks[secondBlockIdx], blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
            Orientation.ninety:     [blocks[firstBlockIdx], blocks[fourthBlockIdx]],
            Orientation.oneEighty:  [blocks[firstBlockIdx], blocks[secondBlockIdx], blocks[fourthBlockIdx]],
            Orientation.twoSeventy: [blocks[firstBlockIdx], blocks[fourthBlockIdx]]
        ]
    }
}
