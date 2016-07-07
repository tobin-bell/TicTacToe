//
//  Game.swift
//  Tic Tac Toe
//
//  Created by Tobin Bell on 7/7/16.
//  Copyright © 2016 Tobin Bell. All rights reserved.
//

import Foundation

class TicTacToeModel {
    
    enum GameState {
        case InProgress, Won, Tied
    }
    
    private var board = [String](count: 9, repeatedValue: "")
    
    var turnCount: Int {
        return board.filter { $0 != "" } .count
    }
    
    var nextPlayer: String {
        return turnCount % 2 == 0 ? "X" : "O"
    }
    
    var previousPlayer: String {
        return turnCount % 2 == 0 ? "O" : "X"
    }
    
    var state: GameState {
        
        if (board[0] == board[1] && board[0] == board[2] && board[0] != "") ||
           (board[3] == board[4] && board[3] == board[5] && board[3] != "") ||
           (board[6] == board[7] && board[6] == board[8] && board[6] != "") ||
           (board[0] == board[3] && board[0] == board[6] && board[0] != "") ||
           (board[1] == board[4] && board[1] == board[7] && board[1] != "") ||
           (board[2] == board[5] && board[2] == board[8] && board[2] != "") ||
           (board[0] == board[4] && board[0] == board[8] && board[0] != "") ||
           (board[2] == board[4] && board[2] == board[6] && board[2] != "") {
            return .Won
        }
        
        if turnCount == 9 {
            return .Tied
        }
        
        return .InProgress
    }
    
    func play(at location: Int) {
        board[location] = nextPlayer
    }
    
    func reset() {
        board = [String](count: 9, repeatedValue: "")
    }
}