//
//  TeleViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 2/28/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class TeleViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    var generoselection:Int = 0
    var edadSelection:Int = 0
    var audioRoot:String = ""
    var nameAudio:String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func actionButton(_ sender: AnyObject) {
        switch sender.tag {
        case 0:
            nameAudio = "Amarillo"
        case 1:
            nameAudio = "Azul_Cielo"
        case 2:
            nameAudio = "Azul_Marino"
        case 3:
            nameAudio = "Blanco"
        case 4:
            nameAudio = "Cafe"
        case 5:
            nameAudio = "Morado"
        case 6:
            nameAudio = "Naranja"
        case 7:
            nameAudio = "Negro"
        case 8:
            nameAudio = "Rojo"
        case 9:
            nameAudio = "Rosa_Fuerte"
        case 10:
            nameAudio = "Verde"
        default:
            nameAudio = "Amarillo"
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
