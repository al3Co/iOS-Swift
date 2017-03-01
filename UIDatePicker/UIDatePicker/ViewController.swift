//
//  ViewController.swift
//  UIDatePicker
//
//  Created by Aldo Contreras on 10/21/16.
//  Copyright © 2016 Aldo Contreras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var label_2: UILabel!
    @IBOutlet weak var label_3: UILabel!
    @IBOutlet weak var label_4: UILabel!
    @IBOutlet weak var label_5: UILabel!
    @IBOutlet weak var label_6: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func displayButtonTapped(_ sender: AnyObject) {
        
        label_1.text = DateFormatter.localizedString(from: myDatePicker.date, dateStyle: DateFormatter.Style.full, timeStyle: DateFormatter.Style.full)
        
        label_2.text = DateFormatter.localizedString(from: myDatePicker.date, dateStyle: DateFormatter.Style.long, timeStyle: DateFormatter.Style.long)
        
        label_3.text = DateFormatter.localizedString(from: myDatePicker.date, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
        
        label_4.text = DateFormatter.localizedString(from: myDatePicker.date, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.short)
        
        let Formatter1 = DateFormatter()
        
        Formatter1.dateFormat = "MMMM dd, YYYY"
        label_5.text = Formatter1.string(from: myDatePicker.date)
        
        Formatter1.dateFormat = "EEEE, dd/MMMM/YYYY"
        label_6.text = Formatter1.string(from: myDatePicker.date)
        
    }
}

