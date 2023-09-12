//
//  ColorRadiusImageView.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit

class ColorRadiusImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setColorRadiusImageView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setColorRadiusImageView() {
        layer.cornerRadius = 50
        layer.borderWidth = 5
        layer.borderColor = randomColor().cgColor
        contentMode = .scaleAspectFill
    }
    
    func randomColor() -> UIColor {
        let r = CGFloat.random(in: 0.7...1)
        let g = CGFloat.random(in: 0.7...1)
        let b = CGFloat.random(in: 0.7...1)
        let color = UIColor(red: r, green: g, blue: b, alpha: 1)
        
        return color
    }
}
