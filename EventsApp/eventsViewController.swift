//
//  eventsViewController.swift
//  EventsApp
//
//  Created by pcshah on 4/7/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class eventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var eventsArray = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if PFUser.currentUser() == nil
        {
            performSegueWithIdentifier("EventsToRegisterSegue", sender: self)
        }
        else
        {
            setEventData()
        }

    }
    
    func setEventData() {
        Event.queryForEvents { (events, error) -> Void in
            self.eventsArray = events as [Event]
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell") as! eventTableViewCell
        let event = eventsArray[indexPath.row] as Event
        cell.eventNameLabel.text = event.title
        cell.eventDateLabel.text = event.date.toStringOfMonthDayAndTime()
        
        event.eventPicFile.getDataInBackgroundWithBlock { (data, error) -> Void in
            cell.eventImageView.image = UIImage(data: data!)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EventToIndividualSegue"
        {
            let individualVC = segue.destinationViewController as! individualEventsViewController
            individualVC.thisEvent = eventsArray[tableView.indexPathForSelectedRow()!.row
            ]
        }
    }
}
