//
//  Person.swift
//  ClassRoster
//
//  Created by Scott Kendall on 11/14/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import UIKit //UIKit also imports Foundation


class Person : NSObject, NSCoding {
    var firstName : String
    var lastName : String
    var image : UIImage?
    
    
    init (firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    
    //for some reason vars need initial values (selectedPerson freaks out)
    override init(){
        self.firstName = "john"
        self.lastName  = "doe"
    }
    
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        if let decodedImage = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = decodedImage
        }
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        if self.image != nil {
            aCoder.encodeObject(self.image!, forKey: "image")
        } else {
            aCoder.encodeObject(nil, forKey: "image")
        }
    }

    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}