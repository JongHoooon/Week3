//
//  CustomTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/28.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    var todo = ToDoInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80.0
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return todo.list.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        
        let row = todo.list[indexPath.row]
        cell.configureCell(row: row)
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 삭제
    override func tableView(
        _ tableView: UITableView,
        canEditRowAt indexPath: IndexPath
    ) -> Bool {
        return true
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        todo.list.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
