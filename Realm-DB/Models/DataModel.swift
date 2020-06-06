//
//  DataModel.swift
//  Realm-DB
//
//  Created by Karem on 6/6/20.
//  Copyright © 2020 Karem. All rights reserved.
//

import Foundation
import RealmSwift


class Data:Object {
    
    @objc dynamic var firstName:String = ""
    @objc dynamic var lastName:String = ""
    @objc dynamic var age:Int = 0
    
}
