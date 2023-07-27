//
//  Extension.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//

import UIKit

extension UITableViewController {
    
    func showAlert() {
        let alert = UIAlertController(
            title: "타이틀",
            message: "메시지",
            preferredStyle: .alert
        )
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}

extension UILabel {
    
    func configureTitleText() {
        self.textColor = .red
        self.font = .boldSystemFont(ofSize: 20.0)
        self.textAlignment = .center
    }
    
}
