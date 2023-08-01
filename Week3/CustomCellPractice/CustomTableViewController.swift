//
//  CustomTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/28.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var todo = ToDoInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80.0
        searchBar.placeholder = "할일을 입력해보세요"
        searchBar.searchTextField.addTarget(
            self,
            action: #selector(searchBarReturnTapped),
            for: .editingDidEndOnExit
        )
        
        tableView.keyboardDismissMode = .onDrag
    }
    
    @objc
    func searchBarReturnTapped() {
        // Todo 항목을
        let data = ToDo(
            main: searchBar.text ?? "",
            sub: "23.08.01",
            like: false,
            done: false
        )
        // list에 추가
        todo.list.insert(data, at: 0)
        // 갱신이 필요하다.
        tableView.reloadData()
        
        searchBar.text = ""
    }
}

extension CustomTableViewController {
    
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
        
        // IBAction 으로 연결하면 재사용때문에 전부다 눌리는 현상 발생한다.
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(
            self,
            action: #selector(likeButtonTapped),
            for: .touchUpInside
        )
        
        return cell
    }
    
    @objc
    func likeButtonTapped(_ sender: UIButton) {
        print(sender.tag)
        
        todo.list[sender.tag].like.toggle()
        tableView.reloadData()
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
