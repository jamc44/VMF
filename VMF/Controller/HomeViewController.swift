//
//  HomeViewController.swift
//  VMF
//
//  Created by Jimmy McCaughey on 7/22/20.
//  Copyright © 2020 Jimmy McCaughey. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   
    @IBOutlet weak var userGalleryBtn: UIButton!
    @IBOutlet weak var forumsBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.buttonRounding(userGalleryBtn)
        Utilities.buttonRounding(forumsBtn)
        Utilities.buttonRounding(settingsBtn)
    }
   
   
    @IBAction func userLoginXIB(_ sender: UIButton) {
        //Shows profileXIB page
        let profile = ProfileVC()
        profile.modalPresentationStyle = .custom
        present(profile, animated: true, completion: nil)
       
    }
}
