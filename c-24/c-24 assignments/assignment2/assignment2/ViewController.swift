//
//  ViewController.swift
//  assignment2
//
//  Created by Scott Kendall on 10/31/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    var myPerson = Person(firstName: "King", lastName: "Kamehameha", isStudent: false)
    // Do any additional setup after loading the view, typically from a nib.

    
    @IBAction func showName(sender: AnyObject) {
        println(myPerson.fullName())
    }

    @IBAction func nextViewButton(sender: AnyObject) {
        println("view2")
    }
}