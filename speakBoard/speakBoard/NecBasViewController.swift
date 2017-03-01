//
//  NecBasViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 2/28/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreData

class NecBasViewController: UIViewController {
    
    var generoselection:Int = 0
    var edadSelection:Int = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var basicOButton: UIButton!
    @IBOutlet weak var bañoOButton: UIButton!
    @IBOutlet weak var camaOButton: UIButton!
    @IBOutlet weak var teleOButton: UIButton!
    @IBOutlet weak var NumerOButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewData()
        if (generoselection == 1){
            imageView.image = UIImage(named: "fondo_hombres.jpg")
            basicOButton.backgroundColor = UIColor.blue
            bañoOButton.backgroundColor = UIColor.blue
            camaOButton.backgroundColor = UIColor.blue
            teleOButton.backgroundColor = UIColor.blue
            NumerOButton.backgroundColor = UIColor.blue
        }
        else{
            imageView.image = UIImage(named: "fondo_mujeres.jpg")
            basicOButton.backgroundColor = UIColor.purple
            bañoOButton.backgroundColor = UIColor.purple
            camaOButton.backgroundColor = UIColor.purple
            teleOButton.backgroundColor = UIColor.purple
            NumerOButton.backgroundColor = UIColor.purple
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                        // print("Edad Core Data \(edad)")
                    }
                    if count == 0 {
                        if let genero = result.value(forKey: "genero"){
                            generoselection = genero as! Int
                            // print("Genero Core Data \(genero)")
                        }
                    }
                    count += 1
                }
            }
        }
        catch let error as NSError {
            print("Reviewing genero error : \(error) \(error.userInfo)")
        }
    }

}
