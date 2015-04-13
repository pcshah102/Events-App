//
//  photoTableViewCell.swift
//  EventsApp
//
//  Created by pcshah on 4/12/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class photoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photographerImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

}

}
