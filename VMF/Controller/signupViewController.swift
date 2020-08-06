//
//  SignUpViewController.swift
//  VMF
//
//  Created by Jimmy McCaughey on 7/22/20.
//  Copyright © 2020 Jimmy McCaughey. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class signupViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var firstnameTextfield: UITextField!
    @IBOutlet weak var lastnameTextfield: UITextField!
    
   
    
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setUpElements()
    }
    func setUpElements() {
        //this is for hiding the errorlabel by default
        errorLabel.alpha = 0
        
        //These are all for styling the textfields, they are styled off the the utilities functions for each textfield type that we wrote in the model file
        Utilities.styleTextField(usernameTextfield)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passWordTextField)
        Utilities.styleFilledButton(signUpBtn)
        Utilities.styleTextField(firstnameTextfield)
        Utilities.styleTextField(lastnameTextfield)
    }

    
    //Checks the fields and validates the data to make sure it is correct. this method returns nil otherwise it will return a error. This method just checks to see if a field was left empty.
    
    func  validateFields() -> String? {
    //Checking that all fields are filled in
        if usernameTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            firstnameTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastnameTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                    ||
            passWordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all Fields"
        }
        
        
        //Checking if password is secure
        let cleanedPassword = passWordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your pasword is 8 characters long, has a special character and a number"
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
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
        else {//continue to create user/ need to import firebase auth
            
            //create cleaned versions of the data  (trimming the whitespaces)
            let username = usernameTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passWordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let firstname = firstnameTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = lastnameTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            //Create User
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //check for errors
                if err != nil {
                    //there was an error creating the user
                    showError("Error creating user")
                }
                else{
                    //If no errors, and Successful user creation please enter first and last name
                    //import Firebase for controller
                  
                    
                    /*Adding data to firestore:
                     1.Firestore.firestore().collection("users") - adds the new signed up users collection in firebase
                     2. .addDocument(data: [USERNAME : username, FIRST_NAME : firstname, LAST_NAME:lastname, EMAIL :email, PASSWORD : password, - the fields that it adds to firebase (KEY/VALUE pairs in the dictionary)
 
                     */ 
                    Firestore.firestore().collection(USERS_REF).addDocument(data: [USERNAME : username, FIRST_NAME : firstname, LAST_NAME:lastname, EMAIL :email, PASSWORD : password,
                    "uid":result!.user.uid ]) { (error) in
                    if error != nil {
                //show error message
                showError("User data couldn't be processed")
                                                                }
                    }
                
                }
            }
                   
                   //Transition to home screen
            self.transitionToHome()
        }
       
    }
    func transitionToHome(){
        //Created a constant that moves you back to the homeview controller when finished on screen (REFERENCE TO HOMEVIEWCONTROLLER). Because this returns as a viewController you need to cast it as a homeviewcontroller type and to do that you use the as?
       
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        //swapping out rootviewcontroller access the view grab rootVC property and assign HomeVC tto it 
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
