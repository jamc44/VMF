//
//  UserdataServices.swift
//  VMF
//
//  Created by Jimmy McCaughey on 7/30/20.
//  Copyright © 2020 Jimmy McCaughey. All rights reserved.
//

import Foundation
import Firebase

class Userdata {
    //private(set) var userImage: UIImage!
    private(set) var firstname: String!
    private(set) var lastname: String!
    private(set) var email: String!
    private(set) var username: String!
    private(set) var documentID: String!
    //FOR TABLEVIEW
    private(set) var category:String!
    private(set) var message:String!
    private(set) var timestamp:String!
    
    
    
    init(username: String, email: String, firstname: String, lastname: String, documentID: String)
    {
        self.username = username
      // self.userImage = userImage
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.documentID = documentID
    }
    
    
}
