//
//  DetailViewController.swift
//  assignment4
//
//  Created by Scott Kendall on 11/12/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController, UITextFieldDelegate {

    // outlets for text field
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var selectedPerson = Person(firstName: String())

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.firstNameTextField.delegate = self
        
        self.title = self.selectedPerson.firstName
        
        
        self.firstNameTextField.text = self.selectedPerson.firstName
        //formatting
        self.view.backgroundColor = UIColor.greenColor()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
