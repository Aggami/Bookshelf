//
//  Note.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 03/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import Foundation
import RealmSwift

class Note : Object {
    @objc dynamic var categoryNum:Int = 0
    
    var category:Category {
        get {
            return Category(rawValue: categoryNum)!
        }
        set {
            categoryNum = newValue.rawValue
        }
    }
    @objc dynamic var text:String = ""
    
    var parentBook = LinkingObjects(fromType: Book.self, property: "notes")
}

enum Category : Int {
    case note = 0
    case quote = 1
    case trivia = 2
    case opinion = 3
    
    static var count:Int {
        return Category.opinion.rawValue + 1
    }
    
    func description() -> String {
        switch self {
        case .note:
            return "Note"
        case .quote:
            return "Quote"
        case .trivia:
            return "Trivia"
        case .opinion:
            return "Opinion"
        }
    }
    
    func categoryColorName() -> String {
        switch self {
        case .note:
            return "Background"
        case .quote:
            return "MainColor"
        case .trivia:
            return "TextColor"
        case .opinion:
            return "AccentImpRed"
        }
    }
}
