//
//  Person.swift
//  ClassRoster
//
//  Created by Scott Kendall on 11/14/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import UIKit //UIKit also imports Foundation


class Person {
    var firstName : String
    var lastName : String
    var image : UIImage?
    
    
    init (firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    //for some reason vars need initial values (selectedPerson freaks out)
    init(){
        self.firstName = "john"
        self.lastName  = "doe"
    }
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}