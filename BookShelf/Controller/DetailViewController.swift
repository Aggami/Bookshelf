//
//  DetailViewController.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 01/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var book:Book?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var notes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currBook = book {
            titleLabel.text = currBook.title
            authorLabel.text = currBook.author
            descriptionLabel.text = "?/"
            progressSlider.minimumValue = 0.0
            progressSlider.maximumValue = Float(currBook.maxPages)
            progressSlider.value = Float(currBook.pagesRead)
            coverImage.image = UIImage(named: "PrideAndPrejudice")
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
