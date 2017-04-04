//
//  videoViewController.swift
//  PortalMisterio
//
//  Created by Aldo Contreras on 4/3/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit

class videoViewController: UIViewController {
    
    @IBOutlet weak var myWebVIew: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getVideo(videoCode: "npoHKT3lG8M")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getVideo(videoCode:String){
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        //let url = URL(string: "https://www.youtube.com/watch?v=npoHKT3lG8M")
        myWebVIew.loadRequest(URLRequest(url: url!))
        
    }
}
