//
//  FirstViewController.swift
//  DataBase_Tabbed
//
//  Created by Aldo Contreras on 10/25/16.
//  Copyright © 2016 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController{
    
    @IBOutlet weak var Dato1TextField: UITextField!
    @IBOutlet weak var Dato2TextField: UITextField!
    @IBOutlet weak var Dato3TextField: UITextField!
    var TextBox1: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SaveButton(_ sender: AnyObject) {
        let dataToSave = Dato1TextField.text
        self.save(name: dataToSave!)
    }
    
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "Dato1", in: managedContext)!
        let dato1 = NSManagedObject(entity: entity,insertInto: managedContext)
        // 3
        dato1.setValue(name, forKeyPath: "name")
        // 4
        do {
            try managedContext.save()
            TextBox1.append(dato1)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
