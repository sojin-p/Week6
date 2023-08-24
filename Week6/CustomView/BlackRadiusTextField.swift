//
//  BlackRadiusTextField.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit //1.

//2.
class BlackRadiusTextField: UITextField { //여러군데서 재활용~
    
    //Interface Builder를 사용하지 않고, UIView를 상속 받은 Custom Class를 '코드'로 구성할 때 사용되는 초기화 구문
    //4-1. init frame - 인스턴스 생성할 때 바로 호출이 되어라!
    override init(frame: CGRect) { //UIView에서 온 이니셜라이저
        super.init(frame: frame) //4-2.
        setupView()
    }
    
    //XIB -> Nib 변환 과정에서 객체 생성 시 필요한 init 구문(storyboard)
    //Interdace Builder를 통해서 생성된 뷰들이 초기화될 때 실행되는 구문!
    //NSCoding 프로토콜에서 온 것(맨 밑에 설명)
    required init?(coder: NSCoder) { //4-3. 에러 fix하면 뜨는데.. 위랑 세트임(위는 코드베이스, 이거는 스토리보드용)
        fatalError("init(coder:) has not been implemented")
    }
    
    //2-1.
    func setupView() {
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .blue
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
    }
    
}

//NSCoding 구조를 이해하는 흐름~
protocol ExampleProtocol {
    init(name: String) //무조건 강제하는 init구문
}

class Mobile: ExampleProtocol {
    //required: '프로토콜'에서 생성된 경우 사용하는 키워드 | override: 슈퍼 클래스에서 온 것
    //Required Initializer
    required init(name: String) {
        
    }
    
}
