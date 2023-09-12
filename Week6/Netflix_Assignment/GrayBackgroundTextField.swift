//
//  GrayBackgroundTextField.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit

class GrayBackgroundTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textAlignment = .center
        textColor = .white
        backgroundColor = .gray
        layer.cornerRadius = 7
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceholder(_ placeholder: String) {
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray2])

    }
}
