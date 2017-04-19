//
//  CamaViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 2/28/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class CamaViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var player:AVAudioPlayer = AVAudioPlayer()
    var generoselection:Int = 0
    var edadSelection:Int = 0
    var audioRoot:String = ""
    var nameAudio:String = ""
    
    
    @IBAction func actionButton(_ sender: AnyObject) {
        switch sender.tag {
        case 0:
            nameAudio = "Camisa manga corta"
        case 1:
            nameAudio = "Blusa"
        case 2:
            nameAudio = "Hacer la cama"
        case 3:
            nameAudio = "Camisa manga larga"
        case 4:
            nameAudio = "Falda"
        case 5:
            nameAudio = "Pantalón de Mezclilla"
        case 6:
            nameAudio = "Playera"
        case 7:
            nameAudio = "Sandalias"
        case 8:
            nameAudio = "Short"
        case 9:
            nameAudio = "Tenis"
        case 10:
            nameAudio = "Pantalón de Vestir"
        case 11:
            nameAudio = "Vestido"
        case 12:
            nameAudio = "Zapatillas"
        case 13:
            nameAudio = "Zapatos"
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
