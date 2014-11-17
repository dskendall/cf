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
        self.title = "Class Rooster"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
        //create some people
        var person1 = Person(firstName: "Brad", lastName: "Johnson")
        var person2 = Person(firstName: "Brad", lastName: "Johnson")
        var person3 = Person(firstName: "Brad", lastName: "Johnson")
        var person4 = Person(firstName: "Brad", lastName: "Johnson")
        var person5 = Person(firstName: "Brad", lastName: "Johnson")
        
        //add them to the array
        self.people = [person1, person2, person3, person4, person5]
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        var personToDisplay = self.people[indexPath.row]
        
        //show the fullname in each cell
        cell.textLabel.text = personToDisplay.fullName()
        
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
