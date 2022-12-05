//
//  ViewController.swift
//  To-Do-List
//
//  Created by admin on 03.12.2022.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    // MARK: - Variables
    
    var items = [CheckListItem]()
    
    let row0item = CheckListItem()
    let row1item = CheckListItem()
    let row2item = CheckListItem()
    let row3item = CheckListItem()
    let row4item = CheckListItem()
    
    var ViewBackgroundColor = UIColor.black
    var textColor = UIColor.white
    var themeColor = UIColor.orange
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
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
        return items.count
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
      commit editingStyle: UITableViewCell.EditingStyle,
      forRowAt indexPath: IndexPath
    ) {
      // 1
      items.remove(at: indexPath.row)

      // 2
      let indexPaths = [indexPath]
      tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
//        cell.backgroundColor = ViewBackgroundColor
        
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
//        cell.tintColor = themeColor
        label.text = item.text
//        label.textColor = textColor
    }
    
    // MARK: - Add Item ViewController Delegates
    func addItemViewControllerDidCancel(
      _ controller: AddItemTableViewController
    ) {
      navigationController?.popViewController(animated: true)
    }

    func addItemViewController(
      _ controller: AddItemTableViewController,
      didFinishAdding item: CheckListItem
    ) {
      let newRowIndex = items.count
      items.append(item)

      let indexPath = IndexPath(row: newRowIndex, section: 0)
      let indexPaths = [indexPath]
      tableView.insertRows(at: indexPaths, with: .automatic)
      navigationController?.popViewController(animated:true)
    }
    
    // MARK: - Navigation
    override func prepare(
      for segue: UIStoryboardSegue,
      sender: Any?
    ) {
      // 1
      if segue.identifier == "AddItem" {
        // 2
        let controller = segue.destination as! AddItemTableViewController
        // 3
        controller.delegate = self
      }
    }
    

    
}

