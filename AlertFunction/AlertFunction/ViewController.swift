//
//  ViewController.swift
//  AlertFunction
//
//  Created by Aldo Contreras on 2/12/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        createAlert(getTitle: "Do you like x or y? ", getMessage: "Do you")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createAlert (getTitle:String, getMessage:String){
        //configure Alert
        let alert = UIAlertController(title: getTitle, message: getMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        //Action: Creating buttons
        alert.addAction(UIAlertAction(title: "X", style: UIAlertActionStyle.default , handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("X")
        }))
        
        
        alert.addAction(UIAlertAction(title: "Y", style: UIAlertActionStyle.default , handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Y")
        }))
        
        
        
        //Display it
        self.present(alert, animated: true, completion: nil)
    }
    

}

