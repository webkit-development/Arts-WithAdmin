//
//  LoginVC.swift
//  Art
//
//  Created by Kevin Stradtman on 4/7/22.
//

import UIKit
import Firebase


class LoginVC: UIViewController {

    // Outlets
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func forgotPassClicked(_ sender: Any) {
        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        guard let email = emailTxt.text , email.isNotEmpty ,
              let password = passwordTxt.text , password.isNotEmpty else {return}
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                debugPrint(error)
                self.activityIndicator.stopAnimating()
                return
            }
            self.activityIndicator.stopAnimating()
            print("Login was successful")
        }
    }
    
    @IBAction func guestClicked(_ sender: Any) {
    
    }
    
}
