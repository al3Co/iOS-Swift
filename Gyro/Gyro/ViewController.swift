//
//  ViewController.swift
//  Gyro
//
//  Created by Aldo Contreras on 2/18/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionData = CMMotionManager()
    
    @IBOutlet weak var gyroLabel: UILabel!
    @IBOutlet weak var gyroLabelY: UILabel!
    @IBOutlet weak var gyroLabelZ: UILabel!
    
    @IBOutlet weak var accelLabel: UILabel!
    @IBOutlet weak var accelLabelY: UILabel!
    @IBOutlet weak var accelLabelZ: UILabel!
    
    @IBOutlet weak var dataTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        motionData.gyroUpdateInterval = 0.2
        motionData.accelerometerUpdateInterval = 0.2
        
        motionData.startGyroUpdates(to: OperationQueue.current!) { (data, errot) in
            if let myData = data{
                /*if myData.rotationRate.x > 3 {
                    print("You tildet your device")
                    self.gyroLabel.text = "Gyro: " + String(myData.rotationRate.x)
                }
                */
                self.gyroLabel.text = "Gyro X: " + String(myData.rotationRate.x)
                self.gyroLabelY.text = "Gyro Y: " + String(myData.rotationRate.y)
                self.gyroLabelZ.text = "Gyro Z: " + String(myData.rotationRate.z)
            }
        }
        motionData.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data{
                /*if myData.acceleration.x > 4 {
                    print("Shaking =) ")
                    self.gyroLabel.text = "Accel: " + String(myData.acceleration.x)
                }
                */
                self.accelLabel.text = "Accel X: " + String(myData.acceleration.x)
                self.accelLabelY.text = "Accel Y: " + String(myData.acceleration.y)
                self.accelLabelZ.text = "Accel Z: " + String(myData.acceleration.z)
            }
        }
    }
    
    @IBAction func getDataButton(_ sender: Any) {
        self.dataTextView.text = gyroLabel.text! + "\n" + gyroLabelY.text! + "\n" + gyroLabelZ.text! + "\n" + accelLabel.text! + "\n" + accelLabelY.text! + "\n" + accelLabelZ.text!
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

}

