//
//  SettingTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//

import UIKit

final class SettingTableViewController: UITableViewController {
    
    // MARK: - Properties
    private let headerTitiles = SettingCategory
        .allCases
        .map { $0.title }
    
    private let settings = SettingCategory
        .allCases
        .map { $0.details }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - Table View

extension SettingTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return settings.count
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return settings[section].count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") else { return UITableViewCell() }
        
        cell.textLabel?.text = settings[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        
        return headerTitiles[section]
    }
}
