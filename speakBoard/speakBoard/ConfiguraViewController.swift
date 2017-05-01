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
        
        let shareText = "http://ticdiscapacidad.com"
        
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
        handleTap()
    }

    func handleTap() {
        (0...20).forEach { (_) in
            generateAnimatedViews()
        }
    }
    
    fileprivate func generateAnimatedViews() {
        let image = drand48() > 0.5 ? #imageLiteral(resourceName: "thumbs_up") : #imageLiteral(resourceName: "heart")
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
        
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

func customPath() -> UIBezierPath {
    let path = UIBezierPath()
    
    let screenSize: CGRect = UIScreen.main.bounds
    let screenWidthX = screenSize.width
    let screenHeightY = screenSize.height
    
    path.move(to: CGPoint(x: 0, y: (screenHeightY * 0.15)))
    
    let endPoint = CGPoint(x: screenWidthX + 35, y: (screenHeightY * 0.15))
    let randomYShift = 200 + drand48() * 200
    
    let cp1 = CGPoint(x: 100, y: (100 - randomYShift))
    let cp2 = CGPoint(x: 200, y: (200 + randomYShift))
    
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    return path
}
