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
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todos = [TodoModel(id: "1", image: "book_selected", title: "买菜", date: dateFromString("2014-10-28")!), TodoModel(id: "2", image: "Child_selected", title: "画图", date: dateFromString("2014-11-02")!), TodoModel(id: "3", image: "car_selected", title: "带孩子", date: dateFromString("2014-11-11")!), TodoModel(id: "4", image: "Android_selected", title: "煮饭", date: dateFromString("2015-06-12")!)]
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as UITableViewCell?
        let todo = todos[indexPath.row] as TodoModel
        
        let image = cell!.viewWithTag(101) as! UIImageView
        let title = cell!.viewWithTag(102) as! UILabel
        let date = cell!.viewWithTag(103) as! UILabel
        
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: locale)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        image.image = UIImage(named: todo.image)
        title.text = todo.title
        date.text = dateFormatter.stringFromDate(todo.date)
        
        return cell!
    }
    
    //Mark UITableViewDelegate
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todos.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    // Edit Mode
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        print("closed")
        tableView.reloadData()
    }


}

