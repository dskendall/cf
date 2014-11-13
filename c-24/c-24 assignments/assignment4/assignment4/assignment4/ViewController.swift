//
//  ViewController.swift
//  assignment4
//
//  Created by Scott Kendall on 11/12/14.
//  Copyright (c) 2014 Scott Kendall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var people = [Person]()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //give a title to the first view
        self.title = "C24-F2-SEA-11-14-WTF"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
       
      
        //create some people
        var person1 = Person(firstName: "Brad")
        var person2 = Person(firstName: "Brad")
        var person3 = Person(firstName: "Brad")
        var person4 = Person(firstName: "Brad")
        var person5 = Person(firstName: "Brad")
        //add them to the array
        self.people = [person1, person2, person3, person4, person5]
    
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        var personToDisplay = self.people[indexPath.row]
        
        cell.textLabel.text = personToDisplay.firstName
        
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

