//
//  RLGame.swift
//  Fun Gane
//
//  Created by hosam on 11/17/20.
//

import SwiftUI

struct RLGame {
    enum Move:String, CaseIterable {
        case rock = "✊",scissors = "✌️", papers = "👈"
        
        static var winningMove:[Move:Move] {
            [
                .rock: .scissors,
                .papers: .rock,
                .scissors: .papers
            ]
        }
    }
    
    enum Player {
        case one,two
    }
    
    enum Results {
        case win,draw,lose
    }
    
    let allMoves = Move.allCases
    var activePlayer = Player.one
    
    var moves:(first:Move?,second:Move?) = (nil,nil){
        didSet{
            activePlayer = (moves.first != nil && activePlayer == .one) ? .two : .one
        }
    }
    
    var isGameOver:Bool{
        moves.first != nil && moves.second != nil
    }
    
    var winner:Player? = nil
    
    func evaluateResults() -> RLGame.Results? {
        guard let firstMove = moves.first,let secondMove = moves.second else { return nil }
        
        //draw
        if firstMove==secondMove {
            return .draw
        }
        
        if let needMoveToWin = Move.winningMove[firstMove],secondMove == needMoveToWin {
            return .win
        }
        
        return .lose
    }
    
    
}

