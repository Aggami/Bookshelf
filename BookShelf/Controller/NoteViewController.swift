//
//  NoteViewController.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 02/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    var note:Note?
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var noteText: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeNote = note {
            categoryLabel.isHidden = false
            categoryPicker.isHidden = true
            categoryLabel.text = safeNote.category.description()
            categoryLabel.backgroundColor = UIColor(named: safeNote.category.categoryColorName())
            categoryLabel.layer.cornerRadius = 10
            noteText.text = safeNote.text
            
        }
        
        else{
            categoryLabel.isHidden = true
            categoryPicker.isHidden = false
            categoryPicker.dataSource = self
            categoryPicker.delegate = self
        }
        noteText.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
       
        print("Im here")
        
        if !categoryPicker.isHidden {
            //dodawanie notatki
            if let text = noteText.text{
                let note = Note(category: Category(rawValue: categoryPicker.selectedRow(inComponent: 0)) ?? Category.note, text: text)
                print("Dodano notkę o kategorii \(note.category.description()) i tekscie \(note.text)" )
            }
            
        }
        else{
            //edycja notatki
        }
        
        
        dismiss(animated: true, completion: nil)
    }


}

extension NoteViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Category(rawValue: row)?.description()
    }
    
}

extension NoteViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
