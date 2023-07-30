//
//  ShoppingTableViewCell.swift
//  Week3
//
//  Created by JongHoon on 2023/07/30.
//

import UIKit

final class ShoppingTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak private var shoppingTitleLabel: UILabel!
    @IBOutlet weak private var checkBoxButton: UIButton!
    @IBOutlet weak private var starButton: UIButton!
    @IBOutlet weak var shoppingCellBackgroundView: UIView!
    
    func configureShoppingCell(row shoppingInfo: ShoppingInfo) {
        shoppingTitleLabel.text = shoppingInfo.title
        
        let checkBoxImage = shoppingInfo.isChecked ?
            ShoppingImages.checkedBox :
            ShoppingImages.notCheckedBox
        let starImage = shoppingInfo.isStared ?
            ShoppingImages.checkedStar :
            ShoppingImages.notCheckedStar
        checkBoxButton.setImage(checkBoxImage, for: .normal)
        starButton.setImage(starImage, for: .normal)
        
        shoppingCellBackgroundView.layer.cornerRadius = 8.0
        shoppingCellBackgroundView.backgroundColor = .systemGray6
    }
}
