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
    
    var generoselection:Int = 0
    var edadSelection:Int = 0
    
    let a = 1
    
    @IBAction func startButton(_ sender: AnyObject!) {
        if (generoselection != 0 && edadSelection != 0){
            performSegue(withIdentifier: "Selecciona", sender: sender)
        } else{
            performSegue(withIdentifier: "Genero", sender: sender)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func reviewData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            var count = 0
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    // Agregar aqui la funcion de edad
                    if let edad = result.value(forKey: "edad"){
                        edadSelection = edad as! Int
                        //print("Edad Core Data \(edad)")
                    }
                    if count == 0 {
                        if let genero = result.value(forKey: "genero"){
                            generoselection = genero as! Int
                            //print("Genero Core Data \(genero)")
                        }
                    }
                    count += 1
                }
            }
        }
        catch let error as NSError {
            print("Reviewing genero error : \(error) \(error.userInfo)")
        }
        print("edad: \(edadSelection)")
        print("genero: \(generoselection)")
    }
}

