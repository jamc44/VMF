//
//  ProfileVC.swift
//  VMF
//
//  Created by Jimmy McCaughey on 7/29/20.
//  Copyright © 2020 Jimmy McCaughey. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth.FIRAuth
import FirebaseCore
import FirebaseFirestore

class ProfileVC: UIViewController {

    
    //Outlets
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    
    
    
    @IBOutlet private weak var bgView: UIView!
    
    //variables
    private var Userdatas = [Userdata]() //Holds the dictionary data for users
     private var usersCollectionRef: CollectionReference! //CollectionReference object can be used for adding documents, getting document references, and querying for documents (using the methods inherited from `FIRQuery`).
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
  //QUERY DATA FROM FIREBASE
        usersCollectionRef = Firestore.firestore().collection(USERS_REF)// Opening the "users" collection
    }
    
   override func viewWillAppear(_ animated: Bool){
    usersCollectionRef.getDocuments { (snapshot, error) in
        if let err = error {
            debugPrint("Error fetching docs: \(err) ")
        } else {
            for document in (snapshot?.documents)!
            { let data = document.data()
                let username = data["username"] as? String ?? "anonymous"
                let email = data["email"] as? String ?? "anonymous"
                let firstname = data["firstname"] as? String ?? "anonymous"
                let lastname = data["lastname"] as? String ?? "anonymous"
                let documentID = document.documentID
              
                
                let dataInit = Userdata(username: username, email: email, firstname: firstname, lastname: lastname, documentID: documentID)
                
               
             


                //Textfields setting to dictionary user values
                self.username.text = dataInit.username
                self.fullName.text = dataInit.firstname; dataInit.lastname
                self.email.text = dataInit.email
    }
    
           }
    }}
    

    @IBAction func closeModalBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func logoutBtn(_ sender: UIButton) {
           let firebaseAuth = Auth.auth()
           do {
             try firebaseAuth.signOut()
            print("signed out")

           } catch let signOutError as NSError {
             print ("Error signing out: %@", signOutError)
           }
        //Pushing from the XIB to the login page after using firebase logout
       let screen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootViewController") as?   RootViewController
       self.present(screen!, animated: true,  completion: nil)
                print("Navigation controller unavailable! Use present method.")
            }
        
         
             }
    
        





