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
    
    @IBOutlet weak var centerAlignChico: NSLayoutConstraint!
    @IBOutlet weak var centerAlignAdolecente: NSLayoutConstraint!
    @IBOutlet weak var centerAlignGrande: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chicoOButton.layer.cornerRadius = 10
        adolescenteOButton.layer.cornerRadius = 10
        grandeOButton.layer.cornerRadius = 10
        
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerAlignChico.constant -= view.bounds.width
        centerAlignAdolecente.constant -= view.bounds.width
        centerAlignGrande.constant -= view.bounds.width
        
        chicoOButton.isHidden = true
        adolescenteOButton.isHidden = true
        grandeOButton.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        edadSelection = 0
        // deleteAllData()
        
        chicoOButton.isHidden = false
        adolescenteOButton.isHidden = false
        grandeOButton.isHidden = false
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.centerAlignChico.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.15, options: .curveEaseOut, animations: {
            self.centerAlignAdolecente.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.centerAlignGrande.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
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

}
