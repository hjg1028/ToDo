//
//  DetailViewController.swift
//  ToDo
//
//  Created by nanami on 10/20/15.
//  Copyright © 2015 nanami. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var androidButton: UIButton!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var carButton: UIButton!
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTitle.resignFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetButton() {
        androidButton.selected = false
        bookButton.selected = false
        childButton.selected = false
        carButton.selected = false
    }
    
    @IBAction func androidTapped(sender: AnyObject) {
        resetButton()
        androidButton.selected = true
    }
    
    @IBAction func bookTapped(sender: AnyObject) {
        resetButton()
        bookButton.selected = true
    }
    
    @IBAction func childTapped(sender: AnyObject) {
        resetButton()
        childButton.selected = true
    }
    
    @IBAction func carTapped(sender: AnyObject) {
        resetButton()
        carButton.selected = true
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        var imageName: String = ""
        if androidButton.selected {
            imageName = "Android_selected"
        }
        else if bookButton.selected {
            imageName = "book_selected"
        }
        else if childButton.selected {
            imageName = "Child_selected"
        }
        else if carButton.selected {
            imageName = "car_selected"
        }
        let uuid: String = NSUUID().UUIDString
        let todo = TodoModel(id: uuid, image: imageName, title: itemTitle.text!, date: datePicker.date)
        todos.append(todo)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        itemTitle.resignFirstResponder()
    }
}




