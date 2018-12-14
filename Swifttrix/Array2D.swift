//
//  Array2D.swift
//  Swifttrix
//
//  Created by BitBill on 2018/12/14.
//  Copyright © 2018 CircleTable. All rights reserved.
//

import Foundation

class Array2D<T> {
    let columns: Int
    let rows: Int
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(repeating: nil, count: rows * columns)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {  return array[row * columns + column] }
        set {  array[row * columns + column] = newValue }
    }
    
    
    
}

