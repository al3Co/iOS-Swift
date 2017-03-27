//
//  EdadViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 2/27/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreData

class EdadViewController: UIViewController {
    
    var generoselection:Int = 0
    var edadSelection:Int = 0
    
    @IBOutlet weak var imagenView: UIImageView!
    @IBOutlet weak var chicoOButton: UIButton!
    @IBOutlet weak var adolescenteOButton: UIButton!
    @IBOutlet weak var grandeOButton: UIButton!
    
    @IBAction func chicoButton(_ sender: Any) {
        edadSelection = 1
        storeData()
        performSegue(withIdentifier: "edadToSelec", sender: nil)
    }
    @IBAction func adolescenteButton(_ sender: Any) {
        edadSelection = 2
        storeData()
        performSegue(withIdentifier: "edadToSelec", sender: nil)
    }
    @IBAction func grandeButton(_ sender: Any) {
        edadSelection = 3
        storeData()
        performSegue(withIdentifier: "edadToSelec", sender: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        edadSelection = 0
        // deleteAllData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewData()
        if (generoselection == 1){
            imagenView.image = UIImage(named: "fondo_hombres.jpg")
            chicoOButton.backgroundColor = UIColor.blue
            adolescenteOButton.backgroundColor = UIColor.blue
            grandeOButton.backgroundColor = UIColor.blue
        }
        else{
            imagenView.image = UIImage(named: "fondo_mujeres.jpg")
            chicoOButton.backgroundColor = UIColor.purple
            adolescenteOButton.backgroundColor = UIColor.purple
            grandeOButton.backgroundColor = UIColor.purple
        }
        
        // Do any additional setup after loading the view.
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
                    if count == 0 {
                        if let genero = result.value(forKey: "genero"){
                            generoselection = genero as! Int
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
    
    func storeData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newGenero = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context)
        newGenero.setValue(edadSelection, forKey: "edad")
        do{
            try context.save()
            print("Edad saved: \(edadSelection)")
        }
        catch let error as NSError {
            print("Saving edad error : \(error) \(error.userInfo)")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
