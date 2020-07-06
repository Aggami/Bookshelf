//
//  RealmManager.swift
//  BookShelf
//
//  Created by Agnieszka Miechowicz on 03/07/2020.
//  Copyright © 2020 aggami. All rights reserved.
//

import Foundation

import RealmSwift

class RealmManager {
    private var   realm:Realm

    static let   sharedInstance = RealmManager()
    
    private init() {
        realm = try! Realm()
    }
    
     func deleteDatabase() {
           try! realm.write({
               realm.deleteAll()
           })
       }

       func saveObjects(objs: [Object]) {
           try! realm.write({
               // If update = true, objects that are already in the Realm will be
               // updated instead of added a new.
            realm.add(objs, update: .modified)
           })
       }
        
       
       func getObjects(type: Object.Type) -> Results<Object>? {
           return realm.objects(type)
       }
}
