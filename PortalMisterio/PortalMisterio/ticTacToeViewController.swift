//
//  ticTacToeViewController.swift
//  PortalMisterio
//
//  Created by Aldo Contreras on 4/4/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import AudioToolbox

class ticTacToeViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsActive = true
    var gameFinished = false
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func action(_ sender: AnyObject) {
        if gameFinished == false {
            if (gameState[sender.tag-1] == 0 && gameIsActive == true){
                gameState[sender.tag-1] = activePlayer
                if (activePlayer == 1){
                    sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                    activePlayer = 2
                }
                else{
                    sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                    activePlayer = 1
                }
            }
            for combination in winningCombinations{
                if (gameState[combination[0]] != 0) && (gameState[combination[0]] == gameState[combination[1]]) && (gameState[combination[1]] == gameState[combination[2]]){
                    gameIsActive = false
                    if (gameState[combination[0]] == 1){
                        label.text = "CRUZ HA GANADO!"
                        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                    }
                    else{
                        label.text = "CEROS HA GANADO!"
                        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                    }
                    gameFinished = true
                    playAgainButton.isHidden = false
                    label.isHidden = false
                }
            }
            gameIsActive = false
            for i in gameState{
                if i == 0{
                    gameIsActive = true
                    break
                }
            }
            if gameIsActive == false{
                label.text = "EMPATE!!!"
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                gameFinished = true
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        }
    }
    
    
    @IBAction func playAgain(_ sender: AnyObject) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameFinished = false
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        label.isHidden = true
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsRounds()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func buttonsRounds(){
        playAgainButton.backgroundColor = .clear
        playAgainButton.layer.cornerRadius = 10
        playAgainButton.layer.borderWidth = 2
        playAgainButton.layer.borderColor = UIColor.gray.cgColor
    }
}
