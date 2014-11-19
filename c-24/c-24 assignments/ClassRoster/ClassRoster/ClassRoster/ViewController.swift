//
//  ViewController.swift
//  ClassRoster
//
//  Created by Scott Kendall on 11/14/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var people = [Person]()
    
    //insert Outlet (step 1. set class of ViewController with Table view on it to ViewController, step 2. ctrl-drag from the Table View to ViewController.swift to create an outlet (in this case named it tableView)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //give a title to the first view
        self.title = "iOS Class Roster"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadFromPlist()
        
        
        /* create some people - old way
        var person1 = Person(firstName: "Bradass", lastName: "Johnson")
        var person2 = Person(firstName: "Bradapple", lastName: "Crab")
        var person3 = Person(firstName: "Randy", lastName: "Mofo")
        var person4 = Person(firstName: "Athol", lastName: "Mass")
        var person5 = Person(firstName: "Sandy", lastName: "Anuse")
        
        //add them to the array
        self.people = [person1, person2, person3, person4, person5]
     */
    }
    
    func loadFromPlist(){
        let plistURL = NSBundle.mainBundle().pathForResource("Roster", ofType: "plist")
        let plistArray = NSArray(contentsOfFile: plistURL!)
        for object in plistArray! {
            if let personDictionary = object as? NSDictionary {
                let firstNameFromPlist = personDictionary["First Name"] as String
                let lastNameFromPlist = personDictionary["Last Name"] as String
                var person = Person(firstName: firstNameFromPlist, lastName: lastNameFromPlist)
                self.people.append(person)
            }
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as PersonTableViewCell
        
        var personToDisplay = self.people[indexPath.row]
        
        //show cell content
        cell.nameLabel.text = personToDisplay.fullName()
        cell.subNameLabel.text = "Seattle"
        cell.personImageView.backgroundColor = UIColor.blueColor()
        
       // cell.nameLabel.font = UIFont(name: "Zapfino", size: 10)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_DETAIL" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var personToPass = self.people[selectedIndexPath!.row]
            detailViewController.selectedPerson = personToPass
        }
    }
    
    
    
}

