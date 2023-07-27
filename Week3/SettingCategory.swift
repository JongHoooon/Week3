//
//  SettingCategory.swift
//  Week3
//
//  Created by JongHoon on 2023/07/27.
//

enum SettingCategory: CaseIterable {
case overall
case personal
case etc
    
    var title: String {
        switch self {
        case .overall:      return "전체 설정"
        case .personal:     return "개인 설정"
        case .etc:          return "기타"
        }
    }
    
    var details: [String] {
        switch self {
        case .overall:
            return [
                "공지사항",
                "실험실",
                "버전 정보"
            ]
        case .personal:
            return [
                "개인/보안",
                "알림",
                "채팅",
                "멀티프로필"
            ]
        case .etc:
            return [
                "고객센터/도움말"
            ]
        }
    }
}

