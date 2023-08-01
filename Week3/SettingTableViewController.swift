//
//  SettingTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total
    case personal
    case others
    
    var mainOpitons: String {
        switch self {
        case .total:        return "전체 설정"
        case .personal:     return "개인 설정"
        case .others:       return "기타"
        }
    }
    
    var subOptions: [String] {
        switch self {
        case .total:        return ["공지사항", "실험실", "버전 정보"]
        case .personal:     return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:       return ["고객센터/도움말"]
        }
    }
}

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
        
//        return settings.count
        SettingOptions.allCases.count
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
//        return settings[section].count
        return SettingOptions.allCases[section].subOptions.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") else { return UITableViewCell() }
        
//        cell.textLabel?.text = settings[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = SettingOptions
            .allCases[indexPath.section]
            .subOptions[indexPath.row]
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        
//        return headerTitiles[section]
        return SettingOptions
            .allCases[section]
            .mainOpitons
    }
}
