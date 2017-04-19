//
//  EnviarComentarioViewController.swift
//  speakBoard
//
//  Created by Aldo Contreras on 4/17/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//

import UIKit
import MessageUI

class EnviarComentarioViewController: UIViewController, UITextViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var textViewOutlet: UITextView!
    @IBOutlet weak var enviarButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewOutlet.delegate = self
        textViewOutlet.text = "Escribe aquí tu nombre y comentario"
        textViewOutlet.textColor = UIColor.lightGray
        
        enviarButtonOutlet.backgroundColor = .clear
        enviarButtonOutlet.layer.cornerRadius = 10
        enviarButtonOutlet.layer.borderWidth = 3
        enviarButtonOutlet.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func enviarButtonAction(_ sender: Any) {
        if (textViewOutlet.text.isEmpty || textViewOutlet.text == "Escribe aquí tu nombre y comentario"){
            let Alert = UIAlertController(title: "Caja de comentario vacía", message: "Escribe en la caja para enviar tu comentario", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
            Alert.addAction(dismiss)
            self.present(Alert, animated: true, completion: nil)
        }
        else{
            createAlert(getTitle: "Enviar comentario", getMessage: "¿Estas seguro(a) de enviar este comentario?")
        }
    }
    
    func createAlert(getTitle:String, getMessage:String){
        //configure Alert
        let alert = UIAlertController(title: getTitle, message: getMessage, preferredStyle: UIAlertControllerStyle.alert)
        //Action: Creating buttons
        alert.addAction(UIAlertAction(title: "Si", style: UIAlertActionStyle.default , handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Si")
            self.sendEmail()
            self.textViewOutlet.text = nil
            self.textViewOutlet.text = "Escribe aquí tu nombre y comentario"
            self.textViewOutlet.textColor = UIColor.lightGray
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default , handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("No")
        }))
        //Display it
        self.present(alert, animated: true, completion: nil)
    }
    
    func sendEmail(){
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError2()
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["aldocontrego@gmail.com"])
        mailComposerVC.setSubject("Retroalimentación speakBoard")
        mailComposerVC.setMessageBody(self.textViewOutlet.text, isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "SpeakBoard", message: "Revisa la configuración de tu cuenta de correo", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func showMailError2(){
        let alertController = UIAlertController(title: "SpeakBoard",
                                                message: "Revisa la configuración de tu cuenta de correo",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Abrir configuración", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textViewOutlet.textColor == UIColor.lightGray {
            textViewOutlet.text = nil
            textViewOutlet.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textViewOutlet.text.isEmpty {
            textViewOutlet.text = "Escribe aquí tu nombre y comentario"
            textViewOutlet.textColor = UIColor.lightGray
        }
    }
    
    // To hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //  Dissmis the keyboard when the view ist tapped on:
        textViewOutlet.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
