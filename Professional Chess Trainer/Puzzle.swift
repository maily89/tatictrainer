//
//  Puzzle.swift
//  Professional Chess Trainer
//
//  Created by Phuong on 2/27/16.
//  Copyright © 2016 InspireOn. All rights reserved.
//

import Foundation


public class Puzzle {
    
    var fen: FEN!
    var firstComputerMove: String = ""
    var solutionMoves: String = ""
    var flipBoard: Bool = false
    
    init(FEN: String, computerMove: String, solution: String){
        self.fen = FENUtils().readBoardFromFEN(FEN)
        firstComputerMove = computerMove
        solutionMoves = solution
        if solutionMoves[solutionMoves.startIndex] == "." {
            flipBoard = true
        }
    }
    
    //count from 1
    public func validateMove(move: Move, moveNumber: Int) -> Bool{
        let tokens = solutionMoves
        return true
    }
    
    //count from 1
    public func getNextComputerMove(moveNumber: Int) -> Move {
        var move : Move!
        return move
    }
}