//
//  File.swift
//  VMF
//
//  Created by Jimmy McCaughey on 7/22/20.
//  Copyright © 2020 Jimmy McCaughey. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
    //create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
    //Remove the border on text field
        textfield.borderStyle = .none
        
    //Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton)  {
        
        //Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
   
    static func styleHollowButton(_ button:UIButton) {
        
         //Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
        }
    
    static func buttonRounding(_ button: UIButton) {
        
        button.layer.cornerRadius = 20
    }
    
    static func isPasswordValid(_ password : String) -> Bool{
    let passwordTest = NSPredicate(format: "Self Matches %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return passwordTest.evaluate(with: password)
    }
    
    static func signOut() -> Void { let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
        return
    }
   
   
    }
       

