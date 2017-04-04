//
//  ViewController.swift
//  PortalMisterio
//
//  Created by Aldo Contreras on 3/27/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iniciarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        iniciarButton.backgroundColor = .clear
        iniciarButton.layer.cornerRadius = 10
        iniciarButton.layer.borderWidth = 2
        iniciarButton.layer.borderColor = UIColor.gray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool {return true}
}

