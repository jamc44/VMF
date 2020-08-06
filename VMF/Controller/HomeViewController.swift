//
//  HomeViewController.swift
//  VMF
//
//  Created by Jimmy McCaughey on 7/22/20.
//  Copyright © 2020 Jimmy McCaughey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import FirebaseFirestore

class HomeViewController: UIViewController {

   
    @IBOutlet weak var userGalleryBtn: UIButton!
    @IBOutlet weak var forumsBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    
    
   private var Userdatas = [Userdata]()
   var usersCollectionRef: CollectionReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.buttonRounding(userGalleryBtn)
        Utilities.buttonRounding(forumsBtn)
        Utilities.buttonRounding(settingsBtn)
    }

   
    @IBAction func XIBProfileBtnPressed(_ sender: UIButton) {
        //Shows profileXIB page
        let profile = ProfileVC()
        profile.modalPresentationStyle = .custom
        present(profile, animated: true, completion: nil)
        
    }
   
    @IBAction func forumBtnSegue(_ sender: Any) {
        performSegue(withIdentifier: TO_FORUMS, sender: nil)
    }
    
}

