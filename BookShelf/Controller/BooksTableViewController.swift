//
//  BooksTableViewController.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 30/06/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit
import RealmSwift

class BooksTableViewController: UITableViewController {

    let realm = try! Realm()
    
    var books:Results<Book>?
    
    var selectedBook:Book?
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    override func viewWillAppear(_ animated: Bool){
       reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(BooksTableViewController.reloadData), name: NSNotification.Name(rawValue: "modalIsDimissed"), object: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 1
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell

        if let book = books?[indexPath.row] {
            cell.titleLabel.text = book.title
            cell.authorLabel.text = book.author
            cell.coverImage.image = book.getImage()
            cell.progressBat.progress = Float(book.pagesRead)/Float(book.maxPages)
        }
        
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let book = books?[indexPath.row]{
            selectedBook = book
            performSegue(withIdentifier: "TableToDetail", sender: self)
        }

    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableToDetail" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.book = selectedBook
            
        }
    }
    
    @objc func reloadData() {
         books = self.realm.objects(Book.self)
        tableView.reloadData()
    }
    

}
