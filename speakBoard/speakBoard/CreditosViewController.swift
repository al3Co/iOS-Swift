//
//  CreditosViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 4/17/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit

class CreditosViewController: UIViewController {
    
    @IBOutlet weak var enviarButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        enviarButton.backgroundColor = .clear
        enviarButton.layer.cornerRadius = 10
        enviarButton.layer.borderWidth = 3
        enviarButton.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
