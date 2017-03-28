//
//  ReportarViewController.swift
//  PortalMisterio
//
//  Created by Aldo Contreras on 3/27/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import Social

class ReportarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imagePicked: UIImageView!
    @IBOutlet weak var enviarOButton: UIButton!
    let picker = UIImagePickerController()
    var chosenImage = UIImage()
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
    
    @IBAction func openPhotoLibraryButton(_ sender: AnyObject) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
        picker.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imagePicked.contentMode = .scaleAspectFit //3
        imagePicked.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
        enviarOButton.isEnabled = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        enviarOButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {return true}
}
