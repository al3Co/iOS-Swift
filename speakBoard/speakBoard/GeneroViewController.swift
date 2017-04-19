//
//  GeneroViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 2/27/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreData

class GeneroViewController: UIViewController {
    
    var generoselection:Int = 0

    @IBAction func hombreButton(_ sender: Any) {
        generoselection = 1
        savingUserData()
    }
    @IBAction func mujerButton(_ sender: Any) {
        generoselection = 2
        savingUserData()
    }
    
    func savingUserData(){
        usersData.saveData(Data: generoselection, key: "genero")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        generoselection = 0
        deleteUserData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deleteUserData(){
        usersData.saveData(Data: 0, key: "edad")
        usersData.saveData(Data: generoselection, key: "genero")
    }

}
