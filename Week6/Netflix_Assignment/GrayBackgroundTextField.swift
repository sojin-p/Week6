//
//  GrayBackgroundTextField.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit

class GrayBackgroundTextField: UITextField {
    
    func setTextField(_ placeholder: String) {
        backgroundColor = .gray
        layer.cornerRadius = 7
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textAlignment = .center
    }
}
