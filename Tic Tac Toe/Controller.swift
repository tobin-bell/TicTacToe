//
//  Controller.swift
//  Tic Tac Toe
//
//  Created by Tobin Bell on 7/7/16.
//  Copyright © 2016 Tobin Bell. All rights reserved.
//

import UIKit

class TicTacToeController: UIViewController {
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var game = TicTacToeModel()
    
    @IBAction func newGameButtonPressed(sender: UIButton) {
        game.reset()
        
        for case let button as UIButton in boardView.subviews {
            button.setTitle("", forState: [])
            button.userInteractionEnabled = true
        }
        
        statusLabel.text = "\(game.nextPlayer)'s Turn"
        boardView.userInteractionEnabled = true
        view.backgroundColor = UIColor.whiteColor()
    }
    
    @IBAction func boardButtonPressed(sender: UIButton) {
        game.play(at: sender.tag)
        sender.setTitle(game.previousPlayer, forState: [])
        sender.userInteractionEnabled = false
    
        if game.state == .Won {
            statusLabel.text = "\(game.previousPlayer) Wins!"
            boardView.userInteractionEnabled = false
            view.backgroundColor = UIColor.lightBlueColor()
            
        } else if game.state == .Tied {
            statusLabel.text = "It's a Tie!"
            boardView.userInteractionEnabled = false
            view.backgroundColor = UIColor.lightBlueColor()
            
        } else {
            statusLabel.text = "\(game.nextPlayer)'s Turn"
        }
    }
}

