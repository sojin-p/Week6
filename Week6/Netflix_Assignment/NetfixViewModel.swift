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
    var location = Observable("")
    var recommendation = Observable("")
    
    var result = Observable("")
    
    var boolList: Observable<[Bool]> = Observable(Array(repeating: false, count: 5))
    
    var isValid = Observable(false)
    
    func isValidText(text: String, regex: String, index: Int, error: ValidationError) throws -> Bool {
        let isValid = (text.range(of: regex, options: .regularExpression)) != nil
        
        if isValid {
            boolList.value[index] = true
            return true
        } else {
            boolList.value[index] = false
            throw error
        }
    }
    
    func checkValidation(text: String, regex: String, index: Int,  error: ValidationError, emptyError: String, messge: String) {
        
        do {
            try isValidText(text: text, regex: regex, index: index, error: error)
            result.value = ""
        } catch {
            if text.isEmpty {
                result.value = emptyError
            } else {
                result.value = messge
            }
        }
        
    }
    
    func checkEverything() {
        let list = boolList.value.filter({ $0 == true })
        if list.count == 5 {
            isValid.value = true
        }
    }
    
    func signIn(completion: @escaping () -> Void) {
        
        UserDefaults.standard.set(true, forKey: "isLaunched")
        
        completion()
    }
    
}
