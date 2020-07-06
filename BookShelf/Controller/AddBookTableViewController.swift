//
//  AddBookViewController.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 01/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit
import RealmSwift

class AddBookTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let realm = try! Realm()
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var authorField: UITextField!
    @IBOutlet weak var isbnField: UITextField!
    @IBOutlet weak var pagesReadField: UITextField!
    @IBOutlet weak var totalPagesField: UITextField!
    @IBOutlet weak var bookCover: UIImageView!
    
    var parentController: BooksTableViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.delegate = self
        authorField.delegate = self
        isbnField.delegate = self
        pagesReadField.delegate = self
        totalPagesField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        
            bookCover.image = selectedImage
            bookCover.contentMode = .scaleAspectFit
            bookCover.clipsToBounds = true
        }
        dismiss(animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
    */
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {

            let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo source", preferredStyle: .actionSheet)
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler:
            { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    imagePicker.delegate = self
                    self.present(imagePicker, animated: true, completion: nil) }
            })
            
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default, handler:
            { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.delegate = self
                    self.present(imagePicker, animated: true, completion: nil)
                }
                
            })
            
            photoSourceRequestController.addAction(cameraAction)
            photoSourceRequestController.addAction(photoLibraryAction)
            
            
            present(photoSourceRequestController, animated: true, completion: nil) }
        
    }
    
    
    
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        let title = titleField.text
        let author = authorField.text
        let isbn = isbnField.text
        let pagesRead = Int(pagesReadField.text ?? "0")
        let totalPages = Int(totalPagesField.text ?? "0")
        
        let book = Book()
        book.title = title ?? "No title"
        book.author = author ?? "Author unknown"
        book.ISBN = isbn ?? ""
        book.pagesRead = pagesRead ?? 0
        book.maxPages = totalPages ?? 300
        //let score = Int(scoreLabel.text ?? "5")
        
        try! realm.write(){
            realm.add(book)
        }
        
        //let book = Book(title: title ?? "", author: author ?? "", ISBN: isbn ?? "", maxPages: totalPages ?? 300, shelf: "toRead", pagesRead: pagesRead ?? 0)
        //print(book.title)
        
        dismiss(animated: true) {
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: "modalIsDimissed"), object: nil)
        }
    }
    
    
    
    @IBAction func closePressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    


    @IBAction func onScoreChanged(_ sender: UISlider) {
        scoreLabel.text = String(Int(sender.value))
    }
}

extension AddBookTableViewController : UITextFieldDelegate{
    
    private func textFieldShouldReturn(_ textField: UITextField) {
        textField.resignFirstResponder()

        if let nextTextField = view.viewWithTag(textField.tag + 1)
        {
            nextTextField.becomeFirstResponder()
        }
        
    }
}
