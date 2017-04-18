//
//  ConfiguraViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 3/27/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import Social

class ConfiguraViewController: UIViewController {
    
    @IBOutlet weak var creditosOutletButton: UIButton!
    @IBOutlet weak var compartOutletButton: UIButton!
    
    
    
    @IBAction func shareButton(_ sender: Any) {
        //Alert
        let alert = UIAlertController(title: "Compartir", message: "Comparte la aplicación con tus amigos", preferredStyle: .actionSheet)
        
        let shareText = "https://github.com/al3Co/iOS-Swift/tree/master/speakBoard"
        
        //First action
        let actionOne = UIAlertAction(title: "Facebook", style: .default) { (action) in
            let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
            post.setInitialText(shareText)
            post.add(UIImage(named: "icon_Speak.png"))
            self.present(post, animated: true, completion: nil)
        }
        
        //Second action
        let actionTwo = UIAlertAction(title: "Twitter", style: .default) { (action) in
            let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
            post.setInitialText(shareText)
            post.add(UIImage(named: "icon_Speak.png"))
            self.present(post, animated: true, completion: nil)
        }
        //Cancel action
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        
        //Present alert
        self.present(alert, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        creditosOutletButton.layer.cornerRadius = 10
        compartOutletButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
