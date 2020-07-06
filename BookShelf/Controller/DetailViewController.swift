//
//  DetailViewController.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 01/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, NoteDelegate  {
    func noteEdited() {
        loadNotes()
    }
    
    func addNote(note: Note) {
        try! realm.write{
            print("Dodawanie notatki")
            book?.addNote(note: note)
        }
        loadNotes()
    }
    

    var noteSelected:Note?

    var book:Book?
    
    let realm = try! Realm()

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var notes: UITableView!
    @IBOutlet weak var totalPagesLabel: UILabel!
    @IBOutlet weak var pagesReadLabel: UILabel!
    
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
            pagesReadLabel.text = String(currBook.pagesRead)
            totalPagesLabel.text = String(currBook.maxPages)
        }
        
        notes.delegate = self
        notes.dataSource = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("GOT HERE")

        try! realm.write(){
            print("Changed pages")
            book?.pagesRead = Int(progressSlider.value)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DetailToNote"){
            
            let dest = segue.destination as! NoteViewController
            dest.note = noteSelected
            dest.noteDelegate = self
        }
    }
    
    @IBAction func addNotePressed(_ sender: Any) {
        noteSelected = nil
        performSegue(withIdentifier: "DetailToNote", sender: self)

    }
    
    @IBAction func pagesReadValueChanged(_ sender: UISlider) {
        pagesReadLabel.text = String(Int(progressSlider.value))
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
    
    func loadNotes(){
        notes.reloadData()
    }
    
    
}

protocol NoteDelegate {
    func addNote(note: Note)
    func noteEdited()
}
