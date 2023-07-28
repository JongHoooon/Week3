//
//  StudyTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//

import UIKit

class StudyTableViewController: UITableViewController {

    let studyList = [
        "변수", "상수", "열거형",
        "옵셔널 바인딩", "메서드", "프로퍼티"
    ]
    let appleList = [
        "iphone", "iPad", "apple watch"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.rowHeight = 60.0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    // 1. 셀 갯수(필수!)
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return section == 0 ? studyList.count : appleList.count
    }
    
//    override func tableView(
//        _ tableView: UITableView,
//        titleForHeaderInSection section: Int
//    ) -> String? {
//
//        return section == 0 ? "첫번째 섹션" : "섹션!"
//    }
    
    // 100% 모든 경우의 수를 return 해줘야 함
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        
        if section == 0 {
            return "첫번째 섹셕"
        } else if section == 1 {
            return "두번째 섹션"
        } else if section == 2 {
            return "세번째 섹션"
        } else {
            return nil
        }

    }
    
    
    // 2. 데이터, 디자인 처리
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        // identifier가 없는 셀이 있을 수 있기 때문 옵셔널로 반환해줌 -> 해제 필요!
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = studyList[indexPath.row]
        } else {
            cell.textLabel?.text = appleList[indexPath.row]
        }
        
        return cell
    }
    
    // 3. 셀 높이: 서비스 구현에 따라 필요한 경우가 많지만, 항상 같은 높이를 셀에 적용한다면 비효율적일 수 있음!
//    override func tableView(
//        _ tableView: UITableView,
//        heightForRowAt indexPath: IndexPath
//    ) -> CGFloat {
//        
//        return 66.0
//    }
    
}
