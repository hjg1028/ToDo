//
//  ViewController.swift
//  ToDo
//
//  Created by nanami on 9/20/15.
//  Copyright © 2015 nanami. All rights reserved.
//

import UIKit

var todos: [TodoModel] = []

func dateFromString(dateStr: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-mm-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todos = [TodoModel(id: "1", image: "a.png", title: "买菜", date: dateFromString("2014-10-28")!), TodoModel(id: "2", image: "a.png", title: "买菜", date: dateFromString("2014-10-28")!), TodoModel(id: "3", image: "a.png", title: "买菜", date: dateFromString("2014-10-28")!), TodoModel(id: "4", image: "a.png", title: "买菜", date: dateFromString("2014-10-28")!)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

