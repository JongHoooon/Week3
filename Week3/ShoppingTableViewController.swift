//
//  ShoppingTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//

import UIKit

final class ShoppingTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    private var shoppings: [(isChecked: Bool, title: String, isStared: Bool)] = [
        (true, "그립톡 구매하기", true),
        (false, "사이다 구매", false),
        (false, "아이패드 케이스 최저가 알아보기", true),
        (false, "양말", true)
    ]
    
    // MARK: - UI
    
    @IBOutlet weak private var textFieldBackgroundView: UIView!
    @IBOutlet weak private var inputTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configBackgroundView()
    }
    
    // MARK: - Action
    
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        
        guard let shoppingText = inputTextField.text,
              !shoppingText.isEmpty else { return }
        
        shoppings.append((false, shoppingText, false))
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
        
        return shoppings.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell") else { return UITableViewCell() }
                
        let shopping = shoppings[indexPath.row]
        
        cell.imageView?.image = shopping.isChecked ?
            ShoppingImages.checkedBox :
            ShoppingImages.notCheckedBox
        cell.textLabel?.text = shopping.title
        cell.accessoryView = shopping.isStared ?
            UIImageView(image: ShoppingImages.checkedStar) :
            UIImageView(image: ShoppingImages.notCheckedStar)
        
        return cell
    }
}
