//
//  RegistrationViewController.swift
//  AuthorizationSystem
//
//  Created by Tami on 08.02.2023.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var errorText : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonDidTap (_ sender : UIButton){
        guard let email = EmailTextField.text else { return }
        guard let password = PasswordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebase, error in
            if let e = error{
                self.errorText.text = "*Error : \(e.localizedDescription)"
            } else {
                //go to login
                self.performSegue(withIdentifier: "goToLogin", sender: self)
            }
            
        }
        
    }

}
