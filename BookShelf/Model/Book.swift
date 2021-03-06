//
//  Book.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 01/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import Foundation

import RealmSwift



class Book : Object {
    @objc dynamic var title:String = ""
    @objc dynamic var author:String = ""
    @objc dynamic var ISBN:String?
    @objc dynamic var imagePath:String?
    @objc dynamic var maxPages:Int = 350
    
    var shelf:String {
        switch pagesRead {
        case 0:
            return "ToRead"
        case 1..<maxPages:
            return "InProgress"
        case maxPages:
            return "Finished"
        default:
            return "ToRead"
        }
        
    }
    
    @objc dynamic var pagesRead:Int = 0
    
    let notes = List<Note>()
    
    func addNote(note: Note){
        notes.append(note)
    }
    
    func updatePagesRead(newPagesRead: Int){
        pagesRead = newPagesRead
    }
    
    func getImage() -> UIImage? {
        do {
            let directory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL
            let path = directory.appendingPathComponent(imagePath!)!
            let imageData = try Data(contentsOf: path)
            return UIImage(data: imageData)
        }
        catch {
            print(error.localizedDescription)
        }
        
        
        return nil
    }
    
    
}
