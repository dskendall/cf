//
//  ViewController.swift
//  ClassRoster
//
//  Created by Scott Kendall on 11/14/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   //insert Outlet (step 1. set class of ViewController with Table view on it to ViewController, step 2. ctrl-drag from the Table View to ViewController.swift to create an outlet (in this case named it tableView)
    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let peopleFromArchive = self.loadFromArchive() as [Person]? {
            self.people = peopleFromArchive
        } else {
            self.loadFromPlist()
            self.saveToArchive()
        }

        
        
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.saveToArchive()
    }
    
    
    
    func loadFromArchive() -> [Person]? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [Person] {
            return peopleFromArchive
        }
        return nil
    }
    
    
    
    func saveToArchive() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        NSKeyedArchiver.archiveRootObject(self.people, toFile: documentsPath + "/archive")
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
        //cell.personImageView.backgroundColor = UIColor.blueColor()
        if personToDisplay.image != nil {
            cell.personImageView.image = personToDisplay.image
        }
        
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

