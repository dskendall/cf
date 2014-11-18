//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by Scott Kendall on 11/14/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // outlets

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    //vars
    var selectedPerson = Person()
    var imagePickerController = UIImagePickerController()
    
    
   //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.title = self.selectedPerson.firstName
        if self.selectedPerson.image != nil {
           self.imageView.image = self.selectedPerson.image
        }
        
        //populate text fields
        self.firstNameTextField.text = self.selectedPerson.firstName
        self.lastNameTextField.text = self.selectedPerson.lastName
        
        //formatting
        self.view.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
    }
    
    
    //dismiss keyboard after return when text field is first responder
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func cameraButtonPressed(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }

    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = image
        self.selectedPerson.image = image
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
