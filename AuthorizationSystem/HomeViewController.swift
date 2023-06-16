//
//  HomeViewController.swift
//  AuthorizationSystem
//
//  Created by Tami on 08.02.2023.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var info : UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismiss(animated: true)
        info.text = email
            
        // Do any additional setup after loading the view.
    }
    
    let email = Auth.auth().currentUser?.email
    
    
    
    @IBAction func logOut(_ sender : UIButton){
        do{
            try Auth.auth().signOut()
            dismiss(animated: true)
            performSegue(withIdentifier: "goToLog", sender: self)
        } catch {
            print(error.localizedDescription)
        }
    }
}
