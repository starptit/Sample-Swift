//
//  RealmTestObject.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/17/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit
import RealmSwift


class RealmTestObject: Object {

    dynamic var name = ""
    dynamic var idField = ""

    override static func primaryKey() -> String? {
        return "idField"
    }
}
