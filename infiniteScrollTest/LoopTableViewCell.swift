//
//  LoopTableViewCell.swift
//  infiniteScrollTest
//
//  Created by Sean Calkins on 8/8/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class LoopTableViewCell: UITableViewCell {

    @IBOutlet var imageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var spaceFaceImageView: UIImageView!
    
    
    @IBOutlet var imageWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet var dataLabel: UILabel!
    
    @IBOutlet var horizontalConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
