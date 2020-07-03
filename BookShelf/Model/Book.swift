//
//  Book.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 01/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import Foundation

struct Book {
    let title:String
    let author:String
    let ISBN:String
    
    
    let maxPages:Int
    let shelf:String
    var pagesRead:Int
    
    var notes:[Note]=[]
    
    mutating func addNote(note: Note){
        notes.append(note)
    }
    
    mutating func updatePagesRead(newPagesRead: Int){
        pagesRead = newPagesRead
    }
}
