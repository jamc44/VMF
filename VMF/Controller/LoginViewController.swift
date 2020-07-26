//
//  SignupVCViewController.swift
//  VMF
//
//  Created by Jimmy McCaughey on 7/22/20.
//  Copyright © 2020 Jimmy McCaughey. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
       
    }
    
        func setUpElements() {
            //hiding error label
            errorLabel.alpha = 0
            
            //Style the elements
            Utilities.styleTextField(emailTextField)
            Utilities.styleTextField(passwordTextField)
            Utilities.styleFilledButton(LoginBtn)
        }
    
    //checking that all text fields are filled
    func validateFields() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
        return "Please fill in missing fields"
    }
    
        //making sure password is secure
        let clearedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       
        if Utilities.isPasswordValid(clearedPassword) == false {
            return "Password/username is incorrect please try again"
        }
        return nil
    }
        
        
    
     @IBAction func LoginTapped(_ sender: Any) {
        //Validate fields - function made for displayinf error message if one of the fields is not filled out correctly
               func showError(_ message:String) {
                   errorLabel.text = message
                   errorLabel.alpha = 1
               }
               
               let error = validateFields()
               
               if error != nil {
                   
                   //theres something wrong with the fields show error message
                   showError(error!)
               }
               else {// Validate Text fields: create cleaned versions of the login data and continue and login user
                let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   
        //Signin in the user
                Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
                   
                    if error != nil {
                        //Couldn't sign in
                        self.errorLabel.text = error!.localizedDescription
                        self.errorLabel.alpha = 1
                    } else {
                        
                        
                }
                func transitionToHome() {
                     //When referencing things inside a enclosure use he self key to be more explicit about what is being refernced
                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                                           
                                           //swapping out rootviewcontroller access the view grab rootVC property and assign HomeVC tto it
                    self.view.window?.rootViewController = homeViewController
                    self.view.window?.makeKeyAndVisible()
                                       }
                }
        }
    

    
    }
    

}
