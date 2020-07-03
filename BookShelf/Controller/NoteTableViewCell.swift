//
//  NoteTableViewCell.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 02/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var noteText: UILabel!
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var categoryText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
