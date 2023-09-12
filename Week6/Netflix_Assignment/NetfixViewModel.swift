//
//  NetfixViewModel.swift
//  Week6
//
//  Created by 박소진 on 2023/09/12.
//

import Foundation

class NetfixViewModel {
    
    var email = Observable("")
    var password = Observable("")
    var nickname = Observable("")
    
    var isValid = Observable(false)
    
    func checkValidation() {
        if email.value.count >= 6 && password.value.count >= 4 && nickname.value.count >= 2 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
}
