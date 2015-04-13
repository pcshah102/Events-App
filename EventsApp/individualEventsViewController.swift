//
//  individualEventsViewController.swift
//  EventsApp
//
//  Created by pcshah on 4/12/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class individualEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var thisEvent = Event?()
    var photosArray = [Photo]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setPhotosData()
    {
        Photo.queryForPhotos { (photos, error) -> Void in
            for photo in photos
            {
                if photo.event.objectId == self.thisEvent?.objectId
                {
                    self.photosArray.append(photo)
                }
            }
            self.tableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell") as! photoTableViewCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosArray.count
    }
}
