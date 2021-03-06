//
//  bañoViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 2/28/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class ban_oViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
        
    var player:AVAudioPlayer = AVAudioPlayer()
    var generoselection:Int = 0
    var edadSelection:Int = 0
    var audioRoot:String = ""
    var nameAudio:String = ""
    
    @IBAction func actionButton(_ sender: AnyObject) {
        switch sender.tag {
        case 0:
            nameAudio = "Acostar"
        case 1:
            nameAudio = "Afeitar"
        case 2:
            nameAudio = "Apaga la tele"
        case 3:
            nameAudio = "Baño"
        case 4:
            nameAudio = "Bañar"
        case 5:
            nameAudio = "Dormir"
        case 6:
            nameAudio = "Bañar"
        case 7:
            nameAudio = "Beber"
        case 8:
            nameAudio = "Enciende la tele"
        case 9:
            nameAudio = "Pasear"
        case 10:
            nameAudio = "Hacer la cama"
        case 11:
            nameAudio = "Jugar"
        case 12:
            nameAudio = "Lavar el pelo"
        case 13:
            nameAudio = "Lavar la cara"
        case 14:
            nameAudio = "Comer"
        case 15:
            nameAudio = "Lavar los dientes"
        case 16:
            nameAudio = "Levantar"
        case 17:
            nameAudio = "Pasear"
        case 18:
            nameAudio = "Hablar"
        default:
            nameAudio = "Acostar"
        }
        playAudioPlayer()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewUsersData()
        if (generoselection == 1){
            imageView.image = UIImage(named: "fondo_hombres.jpg")
        }
        else{
            imageView.image = UIImage(named: "fondo_mujeres.jpg")
        }
        selectorFolder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reviewUsersData(){
        generoselection = usersData.reviewData(key: "genero")
        edadSelection = usersData.reviewData(key: "edad")
    }

    func selectorFolder(){
        if (edadSelection == 1){
            audioRoot = "J"
        }
        else if (edadSelection == 2){
            audioRoot = "J"
        }
        else if (edadSelection == 3){
            audioRoot = "A"
        }
        if (generoselection == 1){
            audioRoot = audioRoot + "H"
        }
        else if (generoselection == 2){
            audioRoot = audioRoot + "M"
        }
    }
    
    func playAudioPlayer(){
        do{
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: nameAudio, ofType: "mp3", inDirectory: audioRoot)!))
            player.prepareToPlay()
            player.play()
        }
        catch let error as NSError {
            print("Audio error : \(error) \(error.userInfo)")
        }
    }
}
