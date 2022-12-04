//
//  ViewController.swift
//  To-Do-List
//
//  Created by admin on 03.12.2022.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    // MARK: - Variables
    
    var items = [CheckListItem]()
    
    let row0item = CheckListItem()
    let row1item = CheckListItem()
    let row2item = CheckListItem()
    let row3item = CheckListItem()
    let row4item = CheckListItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = CheckListItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = CheckListItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = CheckListItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = CheckListItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = CheckListItem()
        item5.text = "Eat ice cream"
        items.append(item5)
    }
    
    // MARK: - Table View Delegate
        
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 5
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    // MARK: - Configure Cells
    
    func configureCheckmark(
        for cell: UITableViewCell,
        with item: CheckListItem
    ) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(
        for cell: UITableViewCell,
        with item: CheckListItem
    ) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
}

