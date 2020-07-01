//
//  BooksTableViewController.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 30/06/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController {

    
    var books = [
        Book(title: "Duma i uprzedzenie", author: "Jane Austen", ISBN: "12313124", notes: "Great book....", maxPages: 350, shelf: "Read", pagesRead: 350),
        Book(title: "Duma i uprzedzenie", author: "Jane Austen", ISBN: "12313124", notes: "Great book....", maxPages: 350, shelf: "Read", pagesRead: 350),
        Book(title: "Duma i uprzedzenie", author: "Jane Austen", ISBN: "12313124", notes: "Great book....", maxPages: 350, shelf: "Read", pagesRead: 350),
        Book(title: "Duma i uprzedzenie", author: "Jane Austen", ISBN: "12313124", notes: "Great book....", maxPages: 350, shelf: "Read", pagesRead: 350),
        Book(title: "Duma i uprzedzenie", author: "Jane Austen", ISBN: "12313124", notes: "Great book....", maxPages: 350, shelf: "Read", pagesRead: 350)
    ]
    
    var selectedBook:Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell

        cell.titleLabel.text = books[indexPath.row].title
        cell.authorLabel.text = books[indexPath.row].author
        cell.coverImage.image = UIImage(named: "PrideAndPrejudice")
        cell.progressBat.progress = Float(books[indexPath.row].pagesRead)/Float(books[indexPath.row].maxPages)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = books[indexPath.row]
        performSegue(withIdentifier: "TableToDetail", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableToDetail" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.book = selectedBook
        }
    }
    

}
