//
//  Note.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 03/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import Foundation


struct Note {
    let category:Category
    let text:String
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
