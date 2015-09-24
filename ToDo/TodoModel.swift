//
//  TodoModel.swift
//  ToDo
//
//  Created by nanami on 9/24/15.
//  Copyright © 2015 nanami. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id: String
    var image: String
    var title: String
    var date: NSDate
    
    init (id: String, image: String, title: String, date: NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
    
}
