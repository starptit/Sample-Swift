//
//  ViewController.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/15/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
        
//        let testRealm = RealmConnectorManager()
        
        let realm = RealmConnectorManager.connectDefault()
        
        
        if(realm == nil){
            
            return
        }
        
        let testRealm = RealmConnectorManager(realm: realm!)
        
//        testRealm.eraseAllDatabase()
        
        testRealm.deleteAllRecordOfCurrentObject(RealmTestObject.self)
        
        var copyList:[Object] = []
        
        for i in 1..<10 {
            
            let addObject:RealmTestObject = RealmTestObject()
            addObject.idField = String(i)
            addObject.name = "_Genesis_ Coupe"
            
            /*
            let isExist:Bool = testRealm.isExistingRecord(RealmTestObject.self, primaryKey: addObject.idField)
            
            if isExist == false {
                testRealm.createRecord(addObject)
            }
             */
            
            
            copyList.append(addObject)
        }
        
        testRealm.createListRecord(copyList)
        
        let updateObject:RealmTestObject? = testRealm.getRecordByPrimaryKey(RealmTestObject.self, idValue: "1") as? RealmTestObject
        
        
        
        if updateObject != nil {
            
//            updateObject!.name = "Acura ZDX"
            
            var update = [String:AnyObject]()
            
//            update["abc"] = updateObject!.idField
            update["name"] = "Acura ZDX"
            
//            var testUpdate = RealmTestObject()
//            
//            testUpdate.name = "BMW X6"
//            testUpdate.idField = "1"
            
//            testRealm.updateRecordByPrimaryKey(updateObject!, idValue: updateObject!.idField)
            
            testRealm.updateSpecifiedObjectWithProperties(updateObject!, subSet: update)
        }
        
        let allObject = testRealm.getAllRecord(RealmTestObject.self)
        
        print("\(allObject?.count)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
