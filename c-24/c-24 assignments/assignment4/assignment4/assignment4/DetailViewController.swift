//
//  DetailViewController.swift
//  assignment4
//
//  Created by Scott Kendall on 11/12/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // outlets for text field
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    //vars
    var selectedPerson = Person()
    var imagePickerController = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        
        self.title = self.selectedPerson.firstName
        
        
        //populate text fields
        self.firstNameTextField.text = self.selectedPerson.firstName
        self.lastNameTextField.text = self.selectedPerson.lastName
        
        //formatting
        self.view.backgroundColor = UIColor.greenColor()
    }
    
    
    //dismiss keyboard after return when text field is first responder
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    @IBAction func cameraButtonPressed(sender: AnyObject) {
        if
        UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            self.imagePickerController.delegate = self
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
       // self.imageView.image = image
    }

}
