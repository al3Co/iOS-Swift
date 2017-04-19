//
//  ViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 2/27/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var startOutletButton: UIButton!
    
    var generoselection:Int = 0
    var edadSelection:Int = 0
    var timer: Timer!
    
    @IBAction func startButton(_ sender: AnyObject!) {
        reviewUserData()
        if (generoselection == 0 || edadSelection == 0){
            performSegue(withIdentifier: "Genero", sender: sender)
        } else{
            performSegue(withIdentifier: "Selecciona", sender: sender)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewUserData()
        createAlert(title: "Audio", message: "No olvides activar el audio en tu dispositivo")
        //startOutletButton.backgroundColor = .clear
        startOutletButton.layer.cornerRadius = 10
        //startOutletButton.layer.borderWidth = 3
        //startOutletButton.layer.borderColor = UIColor.black.cgColor
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.setRandomBackgroundColor), userInfo: nil, repeats: true)
        self.setRandomBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func setRandomBackgroundColor() {
        let colors = [
            UIColor.black,
            UIColor.blue,
            UIColor.brown,
            UIColor.darkGray,
            UIColor.purple
        ]
        let randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
        //self.startOutletButton.setTitleColor(colors[randomColor], for: UIControlState.normal)
        //startOutletButton.layer.borderColor = colors[randomColor].cgColor
        startOutletButton.backgroundColor = colors[randomColor] as UIColor
    }
    
    func reviewUserData(){
        edadSelection = usersData.reviewData(key: "edad")
        generoselection = usersData.reviewData(key: "genero")
    }
    
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        //CREATING ON BUTTON
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            //  Add some code here
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

