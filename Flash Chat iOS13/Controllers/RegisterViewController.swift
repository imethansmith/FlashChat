//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { [self] authResult, error in                if let e = error {
                print(e.localizedDescription)
                errorLabel.text = e.localizedDescription
                errorLabel.isHidden = false
            } else {
                // Navigate to chat view controller
                errorLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                errorLabel.text = "Sucess! You're now registered."
                errorLabel.isHidden = false
                performSegue(withIdentifier: K.registerSegue, sender: self)
            }
            }
        }
    }
    
}
