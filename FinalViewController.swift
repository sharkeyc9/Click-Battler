//
//  FinalViewController.swift
//  Final Project
//
//  Created by Temp on 4/27/17.
//  Copyright © 2017 Temp. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    //score output (displays final number of taps
    @IBOutlet weak var scoreText: UILabel!
    //tells which player won
    @IBOutlet weak var winningPlayerText: UILabel!
    
    //takes the player score to use it to find who won
    let p1Score = globalVariables.player1Score
    let p2Score = globalVariables.player2Score
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //finds who won and updates the two text fields accordingly
        if p1Score > p2Score {
            winningPlayerText.text = "Player 1 Wins!"
            scoreText.text = "Score: \(p1Score)"
        } else if p1Score < p2Score {
            winningPlayerText.text = "Player 2 Wins!"
            scoreText.text = "Score: \(p2Score)"
        } else {
            winningPlayerText.text = "Tie!!!"
            scoreText.text = "Score Tied: \(p1Score)"
        }
    }
    
}
