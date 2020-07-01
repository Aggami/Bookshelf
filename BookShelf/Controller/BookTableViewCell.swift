//
//  BookTableViewCell.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 01/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var progressBat: UIProgressView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 5
        cardView.layer.masksToBounds = false
        cardView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.2)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
