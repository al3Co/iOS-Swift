//
//  menuViewController.swift
//  PortalMisterio
//
//  Created by Aldo Contreras on 4/3/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit

class menuViewController: UIViewController {
    
    @IBOutlet weak var reporteOutletButton: UIButton!
    @IBOutlet weak var videosOutletButton: UIButton!
    @IBOutlet weak var acercaOutletButton: UIButton!
    @IBOutlet weak var mysteriousButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsRounds()
        mysteriousButton.isHidden = true
        let randomNum:UInt32 = arc4random_uniform(10)
        if (randomNum == 0) || (randomNum == 1){
            mysteriousButton.isHidden = false
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func buttonsRounds(){
        reporteOutletButton.backgroundColor = .clear
        reporteOutletButton.layer.cornerRadius = 10
        reporteOutletButton.layer.borderWidth = 2
        reporteOutletButton.layer.borderColor = UIColor.gray.cgColor
        //
        videosOutletButton.backgroundColor = .clear
        videosOutletButton.layer.cornerRadius = 10
        videosOutletButton.layer.borderWidth = 2
        videosOutletButton.layer.borderColor = UIColor.gray.cgColor
        //
        acercaOutletButton.backgroundColor = .clear
        acercaOutletButton.layer.cornerRadius = 10
        acercaOutletButton.layer.borderWidth = 2
        acercaOutletButton.layer.borderColor = UIColor.gray.cgColor
        //
        mysteriousButton.backgroundColor = .clear
        mysteriousButton.layer.cornerRadius = 10
        mysteriousButton.layer.borderWidth = 2
        mysteriousButton.layer.borderColor = UIColor.gray.cgColor
    }

}
