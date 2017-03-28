//
//  CapturarViewController.swift
//  PortalMisterio
//
//  Created by Aldo Contreras on 3/27/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import Social


class CapturarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var imagePicked: UIImageView!
    @IBOutlet weak var enviarOButton: UIButton!
    var  chosenImage = UIImage()
    let textToShare:String = "#PortalMisterio "
    
    
    @IBAction func enviarButton(_ sender: Any) {
        //Alert
        let alert = UIAlertController(title: "Compartir", message: "No olvides compartir la ubicación", preferredStyle: .actionSheet)
        //Second action
        let actionOne = UIAlertAction(title: "Twitter", style: .default) { (action) in
            let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
            post.setInitialText(self.textToShare)
            post.add(self.chosenImage)
            self.present(post, animated: true, completion: nil)
        }
        //Cancel action
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionThree)
        
        //Present alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func openCameraButton(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.camera
        image.allowsEditing = false
        self.present(image, animated: true){
            print("Tomando foto")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let metadata = info[UIImagePickerControllerMediaMetadata] as? NSDictionary
        //let mediaURL = info[UIImagePickerControllerMediaURL] as? URL
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imagePicked.contentMode = .scaleAspectFit //3
        imagePicked.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
        enviarOButton.isEnabled = true
        //print(metadata!)
        if let dataDataImage = metadata?["{TIFF}"]{
            print(dataDataImage)
        }
        //for (key, value) in (metadata!){
        //    print("Value: \(value) for key: \(key)")
        //}
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enviarOButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {return true}
}
