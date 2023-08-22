//
//  TextViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.contentMode = .scaleAspectFill
        return view
    }() //이런 뷰가 여러개면 매번 이름짓기 힘드니까 이름 없는 함수로 만들기
    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }() //호출연산자'()' 잊지말자. 이게없으면 연산프로퍼티임
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(photoImageView)
//        view.addSubview(titleTextField)
        
//        for i in [photoImageView, titleTextField] {
//            view.addSubview(i) //반복문
//        }
//
//        //forEach문 위와 같음
//        [photoImageView, titleTextField].forEach { i in //클로저구문
//            view.addSubview(i)
//        }
        
        [photoImageView, titleTextField].forEach { view.addSubview($0) } //위와 같음 (헤더를 달라로)
        
        setupConstraints() //위치는 애드서브뷰 밑으로! 잊지말기
        
        view.backgroundColor = .white

    }
    
    func setupConstraints() {
        
        photoImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3) //뷰랑 같은데, 30% 차지할거야
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20) //텍필의 탑을, 이미지뷰 바텀이랑 똑같이 맞추겠다. 근데 20만큼 밀겠다.
//            make.leadingMargin.equalTo(20)
//            make.trailingMargin.equalTo(-20)
//            make.leading.trailing.equalTo(view).inset(20) //위 두개와 같음
            make.horizontalEdges.equalTo(view).inset(20) //위와 같음
            make.height.equalTo(50)
        }
        
    }
    
}
