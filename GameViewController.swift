//
//  GameViewController.swift
//  Final Project
//
//  Created by Temp on 4/27/17.
//  Copyright © 2017 Temp. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    //timeCounter counts the seconds gone by
    var timeCounter = 0
    //timer is a Timer that fires code every 10 seconds
    var timer: Timer!
    //creates an instance of AVAudioPlayer to be used later
    var dingSoundEffect: AVAudioPlayer!
    
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(GameViewController.counting), userInfo: nil, repeats: false)
        timeCounter = 0
    }
    
    //player 2 score box
    @IBOutlet weak var player2ScoreText: UILabel!
    
    //text field that says versus
    @IBOutlet weak var versusText: UILabel!
    
    //player 1 score box
    @IBOutlet weak var player1ScoreText: UILabel!
    
    //when player 1 taps the button, it adds one to the player 1 score box
    @IBAction func player1Tap(_ sender: AnyObject) {
        if timeCounter < 10 {
        globalVariables.player1Score += 1
        player1ScoreText.text = "Taps: \(globalVariables.player1Score)"
            //animates player 1 score box
        player1ScoreText.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 4.0, options: .allowUserInteraction, animations: { [weak self] in self?.player1ScoreText.transform = .identity}, completion: nil)
            
            
            //creates a path to find the audio file
            let path = Bundle.main.path(forResource: "Ding.wav", ofType:nil)!
            //changes the path into an url type
            let url = URL(fileURLWithPath: path)
            
            do {
                //uses the url to create an AVAudioPlayer type
                let sound = try AVAudioPlayer(contentsOf: url)
                dingSoundEffect = sound
                //plays the sound
                sound.play()
            } catch {
                print("failure")
            }
        } else {
            
        }
    }
    
    //does the same as player1Tap except for player 2
    @IBAction func player2Tap(_ sender: AnyObject) {
        if timeCounter < 10 {
        globalVariables.player2Score += 1
        player2ScoreText.text = "Taps: \(globalVariables.player2Score)"
        player2ScoreText.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 4.0, options: .allowUserInteraction, animations: { [weak self] in self?.player2ScoreText.transform = .identity}, completion: nil)
            
            
            //does same as in player 1 tap
            let path = Bundle.main.path(forResource: "Ding.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                let sound = try AVAudioPlayer(contentsOf: url)
                dingSoundEffect = sound
                sound.play()
            } catch {
                print("failure")
            }
            
        } else {
            
        }
    }


    //once 10 seconds has gone by, the game ends
    func counting() {
        timeCounter += 10
        versusText.text = "Game Over!"
    }
    
    
}
