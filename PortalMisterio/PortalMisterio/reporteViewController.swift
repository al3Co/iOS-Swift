//
//  reporteViewController.swift
//  PortalMisterio
//
//  Created by Aldo Contreras on 4/3/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import Social

class reporteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate{
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var imagePicked: UIImageView!
    @IBOutlet weak var textViewOutlet: UITextView!
    @IBOutlet weak var optionalButtonOutlet: UIButton!
    @IBOutlet weak var enviarOButton: UIButton!
    @IBOutlet weak var filtroOutletButton: UIButton!
    @IBOutlet weak var viewWait: UIActivityIndicatorView!
    
    let context = CIContext(options: nil)
    var textTwitter:String = ""
    var textFacebook:String = "@PortalMisterio "
    
    var chosenImage = UIImage()
    var selector:String = ""
    let picker = UIImagePickerController()
    var textInitial:String = ""
    
    @IBAction func reporteSegment(_ sender: AnyObject) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            comentarFunc()
        case 1:
            reportarFunc()
        case 2:
            capturarFunc()
        default:
            print("Otra cosa")
        }
    }
    
    @IBAction func optionalButton(_ sender: Any) {
        if (selector == "reportar"){
            picker.allowsEditing = false
            picker.sourceType = .photoLibrary
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            picker.modalPresentationStyle = .popover
            present(picker, animated: true, completion: nil)
            picker.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem
        }
        if (selector == "capturar"){
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.camera
            image.allowsEditing = true
            self.present(image, animated: true){
                print("Tomando foto")
            }
        }
    }
    
    @IBAction func enviarButton(_ sender: Any) {
        if (selector == "comentar"){
            if (textViewOutlet.text.isEmpty || textViewOutlet.text == "Escribe aquí tu comentario para Twitter ..."){
                textInitial = "No olvides escribir tu comentario"
                textTwitter = "#PortalMisterio_ "
                textFacebook = "@PortalMisterio "
            }
            else{
                textInitial = "No olvides compartir tu ubicación"
                textTwitter = "#PortalMisterio_ " + self.textViewOutlet.text
                textFacebook = "@PortalMisterio " + self.textViewOutlet.text
            }
        }
        if (selector == "reportar" || selector == "capturar"){
            textInitial = "No olvides compartir tu ubicación"
            textTwitter = "#PortalMisterio_ "
            textFacebook = "@PortalMisterio "
        }
        socialMedia()
    }
    
    func socialMedia(){
        let alert = UIAlertController(title: "Compartir", message: textInitial, preferredStyle: .actionSheet)
        
        let actionOne = UIAlertAction(title: "Facebook", style: .default) { (action) in
            let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
            post.setInitialText(self.textFacebook)
            if (self.selector == "reportar" || self.selector == "capturar"){post.add(self.chosenImage)}
            self.present(post, animated: true, completion: nil)
        }
        let actionTwo = UIAlertAction(title: "Twitter", style: .default) { (action) in
            let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
            post.setInitialText(self.textTwitter)
            if (self.selector == "reportar" || self.selector == "capturar"){post.add(self.chosenImage)}
            self.present(post, animated: true, completion: nil)
        }
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        //Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        //Present alert
        self.present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func filtroButton(_ sender: Any) {
        loadingHUD()
        viewWait.isHidden = false
        let inputImage = CIImage(image: imagePicked.image!)
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        let filteredImage = inputImage?.applyingFilter("CIHueAdjust", withInputParameters: randomColor)
        let renderedImage = context.createCGImage(filteredImage!, from: filteredImage!.extent)
        imagePicked.image = UIImage(cgImage: renderedImage!)
        viewWait.isHidden = true
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func loadingHUD(){
        let spinnerActivity = MBProgressHUD.showAdded(to: self.view, animated: true);
        spinnerActivity.label.text = "Loading";
        spinnerActivity.detailsLabel.text = "Please Wait!!";
        spinnerActivity.isUserInteractionEnabled = false;
    }
    
    private func comentarFunc(){
        selector = "comentar"
        imagePicked.isHidden = true
        textViewOutlet.isHidden = false
        optionalButtonOutlet.isHidden = true
        enviarOButton.isEnabled = true
        enviarOButton.setTitle(" Comentar ", for: .normal)
        filtroOutletButton.isHidden = true
    }
    private func reportarFunc(){
        selector = "reportar"
        imagePicked.isHidden = false
        textViewOutlet.isHidden = true
        enviarOButton.isEnabled = false
        enviarOButton.setTitle(" Enviar ", for: .normal)
        optionalButtonOutlet.setTitle(" Abir fotos ", for: .normal)
        optionalButtonOutlet.isHidden = false
        imagePicked.image = nil
        filtroOutletButton.isHidden = true
    }
    private func capturarFunc(){
        selector = "capturar"
        imagePicked.isHidden = false
        textViewOutlet.isHidden = true
        enviarOButton.isEnabled = false
        enviarOButton.setTitle(" Enviar ", for: .normal)
        optionalButtonOutlet.setTitle(" Abir cámara ", for: .normal)
        optionalButtonOutlet.isHidden = false
        imagePicked.image = nil
        filtroOutletButton.isHidden = true
    }
    
    override func viewDidLoad() {
        comentarFunc()
        buttonsRound()
        super.viewDidLoad()
        picker.delegate = self
        textViewOutlet.delegate = self
        viewWait.isHidden = true
        
        textViewOutlet.text = "Escribe aquí tu comentario para Twitter ..."
        textViewOutlet.textColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        viewWait.isHidden = false
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imagePicked.contentMode = .scaleAspectFit //3
        imagePicked.image = chosenImage //4
        if (selector == "capturar"){UIImageWriteToSavedPhotosAlbum(imagePicked.image!, nil, nil, nil)}
        dismiss(animated:true, completion: nil) //5
        enviarOButton.isEnabled = true
        filtroOutletButton.isHidden = false
        viewWait.isHidden = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    private func buttonsRound(){
        optionalButtonOutlet.backgroundColor = .clear
        optionalButtonOutlet.layer.cornerRadius = 5
        optionalButtonOutlet.layer.borderWidth = 1
        optionalButtonOutlet.layer.borderColor = UIColor.gray.cgColor
        //
        enviarOButton.backgroundColor = .clear
        enviarOButton.layer.cornerRadius = 5
        enviarOButton.layer.borderWidth = 1
        enviarOButton.layer.borderColor = UIColor.gray.cgColor
        //
        filtroOutletButton.backgroundColor = .clear
        filtroOutletButton.layer.cornerRadius = 5
        filtroOutletButton.layer.borderWidth = 1
        filtroOutletButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textViewOutlet.textColor == UIColor.lightGray {
            textViewOutlet.text = nil
            textViewOutlet.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textViewOutlet.text.isEmpty {
            textViewOutlet.text = "Escribe aquí tu comentario para Twitter ..."
            textViewOutlet.textColor = UIColor.lightGray
        }
    }
    
    // To hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //  Dissmis the keyboard when the view ist tapped on:
        textViewOutlet.resignFirstResponder()
    }
    
}
