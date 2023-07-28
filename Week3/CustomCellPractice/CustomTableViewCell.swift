//
//  CustomTableViewCell.swift
//  Week3
//
//  Created by JongHoon on 2023/07/28.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
        
    @IBOutlet weak private var customCellBackgroundView: UIView!
    @IBOutlet weak private var checkBoxImageView: UIImageView!
    @IBOutlet weak private var mainTitleLabel: UILabel!
    @IBOutlet weak private var subTitleLabel: UILabel!
    @IBOutlet weak private var likeButton: UIButton!
    
    func configureCell(row: ToDo) {
        mainTitleLabel.text = row.main
        subTitleLabel.text = row.sub
        checkBoxImageView.image = row.done ?
            UIImage(systemName: "checkmark.square.fill") :
            UIImage(systemName: "checkmark.square")
        let likeImage = row.like ?
            UIImage(systemName: "star.fill") :
            UIImage(systemName: "star")
        likeButton.setImage(likeImage, for: .normal)
    }
}
