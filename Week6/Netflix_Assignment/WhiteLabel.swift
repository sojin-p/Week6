//
//  WhiteLabel.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit

class WhiteLabel: UILabel {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setWhiteLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setWhiteLabel() {
        textColor = .white
        textAlignment = .center
    }
}
