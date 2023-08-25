//
//  PosterImageView.swift
//  Week6
//
//  Created by 박소진 on 2023/08/25.
//

import UIKit

class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setPosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPosterImageView() {
        print(frame.width, frame, "얼마인강")
        backgroundColor = .yellow
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
    }
    
    //image뷰는 하위 뷰를 갖고 있으므로.. 하위 뷰의 레이아웃을 잡아주는 메소드
    override func layoutSubviews() {
        super.layoutSubviews()
        print("서브뷰 메서드 확인:",frame.width, frame)
        layer.cornerRadius = frame.width / 2 //정 원 대응
    }
    
}
