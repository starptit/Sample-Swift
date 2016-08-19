//
//  RealmConnectorManager.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/17/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit
import RealmSwift

/********
 
 - CONFORM TO C-R-U-D PROPERTY OF DATABASE MANAGEMENT.
 - USING PROTOCOL - ORIENTED PROGRAMMING ARCHITECTURE
 
 *******/


struct RealmConnectorManager: CreateRecordRealm,ReadRecordRealm,UpdateRecordRealm,DeleteRecordRealm {
    
    var realm:Realm
    
    init(realm: Realm){
        self.realm = realm
    }
    
    static func connectDefault() -> Realm?{
        do{
            
            let realm = try Realm()
            
            return realm
            
        }catch _ {
            print("Cannot connect to DEFAULT Database")
        }
        
        return nil
    }
    
    static func connectDBWithConfiguration(configuration: Realm.Configuration) -> Realm?{
        do{
            
            let realm = try Realm(configuration: configuration)
            
            return realm
            
        }catch _ {
            print("Cannot connect to CONFIGURATION Database")
        }
        
        return nil
    }
    
}

protocol RealmAbstraction{
    
    var realm:Realm {get set}
}

/****************
 
 - [C]REATE FUNCTIONAL.
 
 ****************/

protocol CreateRecordRealm:RealmAbstraction{
    
}

extension CreateRecordRealm{
    
    func createRecord(object: Object){
        
        do{
            
            try realm.write({
                realm.add(object)
            })
            
        }catch _ {
            
            print("Error When CreateRecordRealm")
        }
    }
    
    func createListRecord(listRecord: [Object]?){
        
        if listRecord == nil || listRecord?.count == 0 {
            
            print("List Object to be inserted is EMPTY")
            return
        }
        
        do{
            
            try realm.write({
                realm.add(listRecord!)
            })
        }catch _ {
            print("Error when adding List Record")
        }
        
    }
}



/****************
 
 - [R]EAD FUNCTIONAL.
 
 ****************/

protocol ReadRecordRealm:RealmAbstraction {
    
}
extension ReadRecordRealm {
    
    func getRecordByPrimaryKey(objectType: Object.Type, idValue:AnyObject?) -> Object?{

            
            let getRecord = realm.objectForPrimaryKey(objectType, key: idValue)
            
            return getRecord
        
        return nil
    }
    
    func getAllRecord(objecType: Object.Type) -> [Object]? {
        
        return realm.objects(objecType).toArray()
        
    }
    
    func isExistingRecord(objectType:Object.Type, primaryKey:AnyObject?) -> Bool {
        let returnObject = self.getRecordByPrimaryKey(objectType, idValue: primaryKey)
        
        if returnObject != nil {
            return true
        }
        
        return false
    }
}



/****************
 
 - [U]PDATE FUNCTIONAL.
 
 ****************/
protocol UpdateRecordRealm:RealmAbstraction {
    
}
extension UpdateRecordRealm{
    func updateSpecifiedObjectWithProperties(object:Object,subSet:[String:AnyObject]?){
        
        do{
            
            try realm.write({
                
                guard subSet != nil else{
                    print("Nil UPDATE dictionary")
                    return
                }
                
                for (key,value) in subSet! {
                    
                    if object[key] != nil {
                        
                        object[key] = value
                        
                    }else{
                        print("Cannot find property in RLMObject \(key)")
                    }
                    
                }
                
                
            })
            
        }catch _ {
            
            print("Error When updateRecordByPrimaryKey")
        }
    }
    
}



/****************
 
 - [D]ELETE FUNCTIONAL.
 
 ****************/
protocol DeleteRecordRealm:RealmAbstraction {
    
}
extension DeleteRecordRealm{
    func deleteRecord(object:Object){
        
        do{
            
            try realm.write({
                realm.delete(object)
            })
            
        }catch _ {
            
            print("Error When deleteRecord")
        }
        
    }
    
    func deleteAllRecordOfCurrentObject(objectType:Object.Type){
        
        do{
            let allRecord = realm.objects(objectType).toArray()
            
            try realm.write({
                realm.delete(allRecord)
            })
            
        }catch _ {
            
            print("Error When deleteAllRecordOfCurrentObject")
        }
    }
    
    func eraseAllDatabase(){
        do{
            try realm.write({
                realm.deleteAll()
            })
            
            
        }catch _ {
            
            print("Error When eraseAllDatabase")
        }
    }
}



//---------------------------- END ---------------------------------//

/****************
 
 - EXTENSION INHERITED REALM RESULTS ARRAY
 
 ****************/
extension Results{
    
    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.List{
    func toArray() -> [T]{
        return self.map{$0}
    }
}

