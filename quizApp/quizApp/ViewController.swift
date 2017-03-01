//
//  ViewController.swift
//  quizApp
//
//  Created by Aldo Contreras on 2/27/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Quiz
    let questions = ["How many days have one year?", "How many is 1 kg?", "Meters un a kilometer?"]
    let answeres = [["365", "366", "364"],["1000grs", "1 ton", "Green"],["1000", "Tokio", "1001"]]
    
    // Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    
    // Label
    @IBOutlet weak var questionLabel: UILabel!
    
    // Button
    @IBAction func action(_ sender: AnyObject) {
        if (sender.tag == Int(rightAnswerPlacement)){
            print("Right")
            points += 1
        } 
        else{
            print("Wrong!!!!!")
        }
        // Return to the first question or next quiestions
        if (currentQuestion != questions.count){
            newQuestion()
        }
        else{
            performSegue(withIdentifier: "showScoreSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendToSegue: ScoreViewController = segue.destination as! ScoreViewController
        sendToSegue.recievedData = points
    }
    
    override func viewDidAppear(_ animated: Bool) {
        points = 0
        currentQuestion = 0
        newQuestion()
    }
    
    // Function to display new question
    func newQuestion(){
        questionLabel.text = questions[currentQuestion]
        // Random placement
        rightAnswerPlacement = arc4random_uniform(3)+1
        // Create a button
        var button:UIButton = UIButton()
        var x = 1
        for i in 1 ... 3{
            // Convert botton to acces
            button = view.viewWithTag(i) as! UIButton
            if (i == Int(rightAnswerPlacement)){
                button.setTitle(answeres[currentQuestion][0], for: .normal)
            }
            else{
                button.setTitle(answeres[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

