//
//  NBasicasViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 2/27/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreData

class NBasicasViewController: UIViewController {
    
    var generoselection:Int = 0
    var edadSelection:Int = 0
    
    @IBOutlet weak var imagenView: UIImageView!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var edadLabel: UILabel!
    
    @IBOutlet weak var NBasicOButton: UIButton!
    @IBOutlet weak var EmoOButton: UIButton!
    @IBOutlet weak var inicioOButton: UIButton!
    
    @IBOutlet weak var centerAlignNBasic: NSLayoutConstraint!
    @IBOutlet weak var centerAlignEmo: NSLayoutConstraint!
    @IBOutlet weak var centerAlignInicio: NSLayoutConstraint!
    
    
    
    @IBAction func inicioActionButton(_ sender: Any) {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerAlignNBasic.constant -= view.bounds.width
        centerAlignEmo.constant -= view.bounds.width
        centerAlignInicio.constant -= view.bounds.width
        
        NBasicOButton.isHidden = true
        EmoOButton.isHidden = true
        inicioOButton.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NBasicOButton.isHidden = false
        EmoOButton.isHidden = false
        inicioOButton.isHidden = false
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.centerAlignNBasic.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.15, options: .curveEaseOut, animations: {
            self.centerAlignEmo.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.centerAlignInicio.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NBasicOButton.layer.cornerRadius = 10
        EmoOButton.layer.cornerRadius = 10
        inicioOButton.layer.cornerRadius = 10
        
        reviewData()
        if (generoselection == 1){
            imagenView.image = UIImage(named: "fondo_hombres.jpg")
            generoLabel.text = "Hombre"
            NBasicOButton.backgroundColor = UIColor.blue
            EmoOButton.backgroundColor = UIColor.blue
            inicioOButton.backgroundColor = UIColor.blue
        }
        else if(generoselection == 2){
            imagenView.image = UIImage(named: "fondo_mujeres.jpg")
            generoLabel.text = "Mujer"
            NBasicOButton.backgroundColor = UIColor.purple
            EmoOButton.backgroundColor = UIColor.purple
            inicioOButton.backgroundColor = UIColor.purple
        }
        else{
            imagenView.image = UIImage(named: "fondo_mujeres.jpg")
            generoLabel.text = "Sin genero: \(generoselection)"
            NBasicOButton.backgroundColor = UIColor.purple
            EmoOButton.backgroundColor = UIColor.purple
            inicioOButton.backgroundColor = UIColor.purple
        }
        if (edadSelection == 1){
            edadLabel.text = "De 3 - 13 años"
        }
        else if (edadSelection == 2){
            edadLabel.text = "De 14 - 24 años"
        }
        else if (edadSelection == 3){
            edadLabel.text = "De 24 - adelante"
        }
        else{
            edadLabel.text = "Sin edad: \(edadSelection)"
        }
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    }

}
