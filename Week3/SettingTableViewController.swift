//
//  SettingTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//

import UIKit

final class SettingTableViewController: UITableViewController {
    
    // MARK: - Properties
    private let headerTitiles = [
        "전체 설정", "개인 설정", "기타"
    ]
    
    private let settings = [
        [
            "공지사항",
            "실험실",
            "버전 정보"
        ],
        [
            "개인/보안",
            "알림",
            "채팅",
            "멀티프로필"
        ],
        [
            "고객센터/도움말"
        ]
    ]
    
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
