//
//  CustomViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {
    
    //3-1. 중복되는 것 지우고 만든 커스텀 텍필 인스턴스 생성
    let idTextField = {
        let view = BlackRadiusTextField()
//        view.setupView() //3-2. 실행 꼭! - 그러나 BlackRadiusTextField에 init 구문안에 호출까지 해둠
        view.placeholder = "아이디를 입력해주세요"
        return view
    }()
    
    let passwordTextField = {
        let view = BlackRadiusTextField()
        view.placeholder = "비밀번호를 입력해주세요"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(10)
            make.centerX.width.height.equalTo(idTextField)
        }
        
        
        
    }
    


}
