//
//  AddBookViewController.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 01/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit

class AddBookTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1)
        {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        return true
        
    }

    @IBAction func onScoreChanged(_ sender: UISlider) {
        
    }
}
