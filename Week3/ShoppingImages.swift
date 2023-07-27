//
//  ShoppingImages.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//
 
import UIKit

enum ShoppingImages {
    
    static let checkedBox = UIImage(systemName: "checkmark.square.fill")?
        .withTintColor(.label, renderingMode: .alwaysOriginal)
    static let notCheckedBox = UIImage(systemName: "checkmark.square")?
        .withTintColor(.label, renderingMode: .alwaysOriginal)
    
    static let checkedStar = UIImage(systemName: "star.fill")?
        .withTintColor(.label, renderingMode: .alwaysOriginal)
    static let notCheckedStar = UIImage(systemName: "star")?
        .withTintColor(.label, renderingMode: .alwaysOriginal)
}
