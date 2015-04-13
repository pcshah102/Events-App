 //
//  eventTableViewCell.swift
//  EventsApp
//
//  Created by pcshah on 4/10/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class eventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var hostImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
