//
//  ViewController.swift
//  AuthorizationSystem
//
//  Created by Tami on 08.02.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
        
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonDidTap (_ sender : UIButton){

        guard let email = emailTextField.text else { return print("mal")}
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebase, error in
            if let e = error{
                self.errorText.text = "*Error: \(e.localizedDescription)"
            } else {
                //go to home screen
                self.performSegue(withIdentifier: "goToHomeScreen", sender: self)
            }
            
        }
        
    }
     
    @IBAction func signUpButtonDidTap (_ sender : UIButton){
        performSegue(withIdentifier: "goToRegister", sender: self)
        
    }


}

