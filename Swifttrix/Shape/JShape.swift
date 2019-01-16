//
//  JShape.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/21.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import UIKit

class JShape: Shape {
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.zero:       [ (1, 0), (1, 1),  (1, 2),  (0, 2)],
            Orientation.ninety:     [ (2, 1), (1, 1),  (0,1), (0, 0)],
            Orientation.oneEighty:  [ (0, 2), (0, 1),  (0, 0),  (-1,0)],
            Orientation.twoSeventy: [ (-1,1), (0, 1),  (1, 1),   (1,0)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.zero:       [blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
            Orientation.ninety:     [blocks[firstBlockIdx], blocks[secondBlockIdx], blocks[fourthBlockIdx]],
            Orientation.oneEighty:  [blocks[firstBlockIdx], blocks[fourthBlockIdx]],
            Orientation.twoSeventy: [blocks[firstBlockIdx], blocks[secondBlockIdx], blocks[thirdBlockIdx]]
        ]
    }
}
