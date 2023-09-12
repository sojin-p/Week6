//
//  LoginTextFeild+Enum.swift
//  Week6
//
//  Created by 박소진 on 2023/09/12.
//

import Foundation

enum LoginTextField {
    case email
    case password
    case nickname
    case location
    case recommendation
    
    var placeHolder: String {
        switch self {
        case .email: return "이메일 또는 전화번호"
        case .password: return "비밀번호"
        case .nickname: return "닉네임"
        case .location: return "위치"
        case .recommendation: return "추천 코드"
        }
    }
    
    var tag: Int {
        switch self {
        case .email: return 0
        case .password: return 1
        case .nickname: return 2
        case .location: return 3
        case .recommendation: return 4
        }
    }
}
