//
//  StartScreenViewController.swift
//  Final Project
//
//  Created by Temp on 4/27/17.
//  Copyright © 2017 Temp. All rights reserved.
//

import UIKit
import AVFoundation

class StartScreenViewController: UIViewController {
    
    var dingSoundEffect: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    globalVariables.player1Score = 0
    globalVariables.player2Score = 0
    }
    
    
    
    @IBAction func startButton(_ sender: AnyObject) {
        
        let path = Bundle.main.path(forResource: "Ding.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            dingSoundEffect = sound
            sound.play()
        } catch {
            print("failure")
        }
    
    }
    
}
