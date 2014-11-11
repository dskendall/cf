//
//  person.swift
//  assignment2
//
//  Created by Scott Kendall on 11/10/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import Foundation

class Person {
    var firstName = ""
    var lastName = ""
    var isStudent : Bool = true
    
    init (firstName : String, lastName : String, isStudent : Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.isStudent = isStudent
    }

    func fullName() {
        println(self.firstName + " " + self.lastName)
    }

}
