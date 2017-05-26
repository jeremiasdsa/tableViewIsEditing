//
//  ViewController.swift
//  TableEditing
//
//  Created by jeremias araujo on 25/05/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    var dataArray : [Int] = []

    var cellStyleForEditing: UITableViewCellEditingStyle = .none
    
    override func viewDidLoad() {
        
        
        //  Converted with Swiftify v1.0.6341 - https://objectivec2swift.com/
        var barButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(self.toggleEdit))
        navigationItem.rightBarButtonItem = barButtonItem

        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataArray = []
        self.tableview.allowsMultipleSelectionDuringEditing = true
        for i in 0...12 {
            dataArray.append(i)
        }
        
        print(dataArray)
        
        
    }
    
    
    //  Converted with Swiftify v1.0.6341 - https://objectivec2swift.com/
    func toggleEdit() {
        tableview.setEditing(!tableview.isEditing, animated: true)
        if tableview.isEditing {
            navigationItem.rightBarButtonItem?.title = "Done"
        }
        else {
            navigationItem.rightBarButtonItem?.title = "Edit"
        }
        
        
        if(cellStyleForEditing == .none) {
            cellStyleForEditing = .delete
            self.tableview.reloadData()
        } else {
            cellStyleForEditing = .none
            self.tableview.reloadData()
        }
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "idcell", for: indexPath) as? CellTableViewCell {
            //cell.isUserInteractionEnabled = true
            let st = String("\(dataArray[indexPath.row])")
            cell.configure(str: st!)
            
            return cell
        }
        return CellTableViewCell()
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.selectionStyle = UITableViewCellSelectionStyle.blue
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        print(cellStyleForEditing)
        
        return UITableViewCellEditingStyle.delete
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        print(tableView.isScrollEnabled)
        print(tableView.cellForRow(at: indexPath)?.isSelected)
        
        print(tableView.cellForRow(at: indexPath)?.accessoryType)
        
        
        
       // UITableViewCellAccessoryCheckmark
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let rateAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Rate") { (action , indexPath ) -> Void in
            self.tableview.isEditing = false
            print("Rate button pressed")
        }
        
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share") { (action , indexPath) -> Void in
            self.tableview.isEditing = false
            print("Share button pressed")
            self.toggleEdit()
        }
        return [rateAction, shareAction]
    }
    

    
}

