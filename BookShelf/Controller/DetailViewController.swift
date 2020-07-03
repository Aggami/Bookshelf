//
//  DetailViewController.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 01/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController  {

    var noteSelected:Note?

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
        
        notes.delegate = self
        notes.dataSource = self
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DetailToNote"){
            
            let dest = segue.destination as! NoteViewController
            dest.note = noteSelected
        }
    }
    
    @IBAction func addNotePressed(_ sender: Any) {
        noteSelected = nil
        performSegue(withIdentifier: "DetailToNote", sender: self)

    }
    

}


extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book?.notes.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") as! NoteTableViewCell
        cell.categoryText.text = book!.notes[indexPath.row].category.description()
        cell.circleImage.tintColor = UIColor(named: book!.notes[indexPath.row].category.categoryColorName())
        cell.noteText.text = book!.notes[indexPath.row].text
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        noteSelected = book!.notes[indexPath.row]
        performSegue(withIdentifier: "DetailToNote", sender: self)
    }
    
}
