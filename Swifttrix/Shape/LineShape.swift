//
//  LineShape.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/21.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import UIKit

class LineShape: Shape {
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.zero:       [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orientation.ninety:     [(-1,0), (0, 0), (1, 0), (2, 0)],
            Orientation.oneEighty:  [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orientation.twoSeventy: [(-1,0), (0, 0), (1, 0), (2, 0)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.zero:       [blocks[fourthBlockIdx]],
            Orientation.ninety:     blocks,
            Orientation.oneEighty:  [blocks[fourthBlockIdx]],
            Orientation.twoSeventy: blocks
        ]
    }
}
