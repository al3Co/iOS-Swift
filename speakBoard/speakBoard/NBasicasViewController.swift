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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewData()
        if (generoselection == 1){
            imagenView.image = UIImage(named: "fondo_hombres.jpg")
            generoLabel.text = "Hombre"
            NBasicOButton.backgroundColor = UIColor.blue
            EmoOButton.backgroundColor = UIColor.blue
        }
        else{
            imagenView.image = UIImage(named: "fondo_mujeres.jpg")
            generoLabel.text = "Mujer"
            NBasicOButton.backgroundColor = UIColor.purple
            EmoOButton.backgroundColor = UIColor.purple
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
            edadLabel.text = "error en algo \(edadSelection)"
        }
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
