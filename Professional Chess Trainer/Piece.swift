//
//  Piece.swift
//  Professional Chess Trainer
//
//  Created by Phuong on 2/16/16.
//  Copyright © 2016 InspireOn. All rights reserved.
//

import Foundation
import UIKit

enum PieceColor {
    case Black
    case White
}

struct IconSet {
    var whitePawn: UIImage!
    var whiteRook: UIImage!
    var whiteKnight: UIImage!
    var whiteBishop: UIImage!
    var whiteQueen: UIImage!
    var whiteKing: UIImage!
    
    var blackPawn: UIImage!
    var blackRook: UIImage!
    var blackKnight: UIImage!
    var blackBishop: UIImage!
    var blackQueen: UIImage!
    var blackKing: UIImage!
    
    init(piece: String){
        
        whitePawn = UIImage(named: piece + "_white_pawn")
        whiteRook = UIImage(named: piece + "_white_rook")
        whiteKnight = UIImage(named: piece + "_white_knight")
        whiteBishop = UIImage(named: piece + "_white_bishop")
        whiteQueen = UIImage(named: piece + "_white_queen")
        whiteKing = UIImage(named: piece + "_white_king")
        
        blackPawn = UIImage(named: piece + "_black_pawn")
        blackRook = UIImage(named: piece + "_black_rook")
        blackKnight = UIImage(named: piece + "_black_knight")
        blackBishop = UIImage(named: piece + "_black_bishop")
        blackQueen = UIImage(named: piece + "_black_queen")
        blackKing = UIImage(named: piece + "_black_king")
    }
}

public class Piece {
    
    var image: UIImage!
    var color: PieceColor!
    
    
    init(image: UIImage, color: PieceColor){
        self.image = image
        self.color = color
    }
    
    public func toPGN() -> String{
        return "";
    }
    
    public func isValidMove(start: (Int, Int), dest: (Int, Int), board: [[Square]]) -> Bool{
        return true;
    }
    
    func isValidDiagonalMove(start: (Int, Int), dest: (Int, Int), board: [[Square]]) -> Bool{
        if (abs(start.0 - dest.0) == abs(start.1 - dest.1)){
            var horizontalDirection = 1
            if (start.0>dest.0){
                horizontalDirection = -1
            }
            
            var verticalDirection = 1
            if (start.1>dest.1){
                verticalDirection = -1
            }
            
            let step = abs(start.0-dest.0)
            for i in 1 ..< step{
                if (!board[start.0+i*horizontalDirection][start.1+i*verticalDirection].isEmpty()){
                    return false;
                }
            }
            return true
        }
        return false;
    }
    
    func isValidHorVerMove(start: (Int, Int), dest: (Int, Int), board: [[Square]]) -> Bool{
        if (start.0 != dest.0 && start.1 != dest.1){
            return false;
        }
        
        //check quan bi vuong
        if (start.0 == dest.0){ // di chuyen theo hang ngang
            if (start.1 > dest.1) {// di chuyen sang trai
                for index in (start.1 - 1).stride(to: dest.1, by: -1){
                    //var index = (start.1 - 1); index > dest.1 ; index -= 1 {
                    if (!board[dest.0][index].isEmpty()){
                        return false;
                    }
                }
            }
            
            if (start.1 < dest.1) {// di chuyen sang phai
                for index in (start.1 + 1) ..< dest.1  {
                    if (!board[dest.0][index].isEmpty()){
                        return false;
                    }
                }
            }
        }
        
        if (start.1 == dest.1){ // di chuyen theo hang doc
            if (start.0 > dest.0) {// di chuyen len tren
                for index in (start.0 - 1).stride(to: dest.0, by: -1){
                    //var index = (start.0 - 1); index > dest.0 ; index -= 1
                    if (!board[index][dest.1].isEmpty()){
                        return false;
                    }
                }
            }
            
            if (start.0 < dest.0) {// di chuyen xuong duoi
                for index in (start.0 + 1) ..< dest.0  {
                    if (!board[index][dest.1].isEmpty()){
                        return false;
                    }
                }
            }
        }
        return true;
    }
}