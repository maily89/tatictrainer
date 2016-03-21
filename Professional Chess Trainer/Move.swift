//
//  Move.swift
//  Professional Chess Trainer
//
//  Created by Phuong on 3/21/16.
//  Copyright © 2016 InspireOn. All rights reserved.
//

import Foundation

public class Move {
    
    var start = (-1, -1)
    var dest = (-1, -1)
    
    init(start: (Int, Int), dest: (Int, Int)){
        self.start = start
        self.dest = dest
    }
    
}