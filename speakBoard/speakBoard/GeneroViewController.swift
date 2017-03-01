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
        storeData()
    }
    @IBAction func mujerButton(_ sender: Any) {
        generoselection = 2
        storeData()
    }
    
    func storeData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newGenero = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context)
        newGenero.setValue(generoselection, forKey: "genero")
        do{
            try context.save()
            print("Genero saved: \(generoselection)")
        }
        catch let error as NSError {
            print("Saving genero error : \(error) \(error.userInfo)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        generoselection = 0
        deleteAllData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deleteAllData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject]{
                let UserData = result
                context.delete(UserData)
            }
            print("Data cleared")
        } catch let error as NSError {
            print("Detele all data in UserData error : \(error) \(error.userInfo)")
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
