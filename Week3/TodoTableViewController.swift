//
//  TodoTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//

import UIKit

final class TodoTableViewController: UITableViewController {
    
    var list = [
        "장보기", "영화보기", "잠자기", "코드보기",
        "과제하기", "복습하기", "쉬기", "쉬자!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


// MARK: - Action

private extension TodoTableViewController {
    
    @IBAction func addButtonTapped(_ sender: Any) {
        // list에 추가
        list.append("고래밥 먹기")
        // 테이블뷰 갱신 (동기화 작업)
        tableView.reloadData()
        
        showAlert()
    }
    
}
 
// MARK: - Table View

extension TodoTableViewController {
    // 1. 섹션 내 셀의 개수: 카톡 친구 수 만큼 셀 갯수가 필요해! 라고 ios에게 전달
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return list.count
    }
    
    // 2. 셀 디자인 및 데이터 처리: 카톡프로필 모서리 둥글게, 프로필 이미지와 상태 메시지 반영 등
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        print(#function, indexPath)
        
        // identifier 는 인터페이스 k빌더에서 설정!
        // 재사용 메커니즘
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            
        cell.textLabel?.text = list[indexPath.row]
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
        
        cell.textLabel?.textColor = .green
        cell.textLabel?.font = .boldSystemFont(ofSize: 20.0)
        
        cell.textLabel?.configureTitleText()
        
        cell.detailTextLabel?.text = "디테일 텍스트"
        cell.detailTextLabel?.textColor = .red
        cell.detailTextLabel?.font = .systemFont(ofSize: 16.0)
        
        cell.imageView?.image = UIImage(systemName: "star.fill")
        
        return cell
    }
    
    // 3. 셀의 높이: 44.0(default)
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        
        return 72.0
    }
}
