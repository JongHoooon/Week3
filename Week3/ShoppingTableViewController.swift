//
//  ShoppingTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//

import UIKit

final class ShoppingTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    private var shoppingInfos: [ShoppingInfo] = [
        ShoppingInfo(title: "그립톡 구매하기", isChecked: true, isStared: true),
        ShoppingInfo(title: "사이다 구매", isChecked: false, isStared: false),
        ShoppingInfo(title: "아이패드 케이스 최저가 알아보기", isChecked: true, isStared: true),
        ShoppingInfo(title: "양말", isChecked: false, isStared: true)
    ]
    
    // MARK: - UI
    
    @IBOutlet weak private var textFieldBackgroundView: UIView!
    @IBOutlet weak private var inputTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configBackgroundView()
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = 60.0
    }
    
    // MARK: - Action
    
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        
        guard let shoppingText = inputTextField.text,
              !shoppingText.isEmpty else { return }
        
        shoppingInfos.append(ShoppingInfo(
            title: shoppingText,
            isChecked: false,
            isStared: false
        ))
        inputTextField.text = nil
        
        tableView.reloadData()
    }
}

// MARK: - Private Methods

private extension ShoppingTableViewController {
    
    func configBackgroundView() {
        textFieldBackgroundView.layer.cornerRadius = 8.0
    }
    
}

// MARK: - Table View

extension ShoppingTableViewController {

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return shoppingInfos.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier) as? ShoppingTableViewCell else { return UITableViewCell() }
                
        let row = shoppingInfos[indexPath.row]
        cell.configureShoppingCell(row: row)
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        
        let info = shoppingInfos[indexPath.row]
        let completeAction = UIContextualAction(
            style: .normal,
            title: "",
            handler: { [weak self] _, _, _ in
                self?.shoppingInfos[indexPath.row].isChecked.toggle()
                self?.tableView.reloadData()
            })
        let startAction = UIContextualAction(
            style: .normal,
            title: "",
            handler: { [weak self] _, _, _ in
                self?.shoppingInfos[indexPath.row].isStared.toggle()
                self?.tableView.reloadData()
            })
        
        switch info.isChecked {
        case true:
            completeAction.image = ShoppingImages.notCheckedBox
        case false:
            completeAction.image = ShoppingImages.checkedBox
        }
        switch info.isStared {
        case true:
            startAction.image = ShoppingImages.notCheckedStar
        case false:
            startAction.image = ShoppingImages.checkedStar
        }
        completeAction.backgroundColor = .green
        startAction.backgroundColor = .blue
        
        return UISwipeActionsConfiguration(actions: [startAction, completeAction])
    }
    
    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: ""
        ) { [weak self] action, view, _ in
            self?.shoppingInfos.remove(at: indexPath.row)
            self?.tableView.reloadData()
        }
        deleteAction.image = ShoppingImages.trash
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
