//
//  ValidationError+Enum.swift
//  Week6
//
//  Created by 박소진 on 2023/09/19.
//

import Foundation

enum ValidationError: Error {
    case emptyString
    case invalidEmail
    case invalidPassword
    case invalidNickname
    case invalidlocation
    case invalidCode
    
    var errorMessage: String {
        switch self {
        case .emptyString: return "내용을 입력해주세요."
        case .invalidEmail: return "이메일 형식(abc@de.fg)으로 \n 6자리 이상 입력해주세요."
        case .invalidPassword: return "대소문자, 숫자, 특수문자를 조합하여 \n 6~30자를 입력해주세요."
        case .invalidNickname: return "2~6자 이내로 입력해주세요."
        case .invalidlocation: return "지역을 입력해주세요."
        case .invalidCode: return "숫자 6자리를 입력해주세요."
        }
    }
    
    var regex: String {
        switch self {
        case .emptyString:
            return ""
        case .invalidEmail:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .invalidPassword:
            return "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{6,30}"
        case .invalidNickname:
            return "[A-Z0-9a-z가-힣]{2,6}"
        case .invalidlocation:
            return "[A-Z0-9a-z가-힣]{2,40}"
        case .invalidCode:
            return "[0-9]{6}"
        }
    }
    
}
