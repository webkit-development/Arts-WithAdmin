//
//  RegisterVC.swift
//  Art
//
//  Created by Kevin Stradtman on 4/7/22.
//

import UIKit
import Firebase


class RegisterVC: UIViewController {
    
    //Outlets
    @IBOutlet var usernameTxt: UITextField!
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var confirmPasswordTxt: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var passImgCheck: UIImageView!
    @IBOutlet var confirmPassImgCheck: UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPasswordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let passTxt = passwordTxt.text else {return}
        if textField == confirmPasswordTxt {
            passImgCheck.isHidden = false
            confirmPassImgCheck.isHidden = false
        } else {
            if passTxt.isEmpty {
                passImgCheck.isHidden = true
                confirmPassImgCheck.isHidden = true
                confirmPasswordTxt.text = ""
            }
        }
        if passwordTxt.text == confirmPasswordTxt.text {
            passImgCheck.image = UIImage(named: AppImages.GreenCheck)
            confirmPassImgCheck.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passImgCheck.image = UIImage(named: AppImages.RedCheck)
            confirmPassImgCheck.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        guard let email = emailTxt.text , email.isNotEmpty ,
              let username = usernameTxt.text , username.isNotEmpty ,
              let password = passwordTxt.text , password.isNotEmpty else {
              simpleAlert(title: "Error", msg: "Please fill out all fields")
              return
        }
        guard let confirmPass = confirmPasswordTxt.text , confirmPass == password else {
            simpleAlert(title: "Error", msg: "Passwords do not match")
            return
        }
        activityIndicator.startAnimating()
        guard let authUser = Auth.auth().currentUser else {
            return
        }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        authUser.link(with: credential) {(result, error) in
            if let error = error {
                debugPrint(error)
                Auth.auth().handleFireAuthError(error: error, vc: self)
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
