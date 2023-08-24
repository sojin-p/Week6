//
//  GenericViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {
    
    let sampleLabel = UILabel()
    let sampleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "네비게이션 타이틀"
        
        view.backgroundColor = .white
        
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .systemPink
        configureBorder(view: sampleLabel) //제네릭 사용하기
        sampleLabel.text = "제네릭 테스트"
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .blue
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        let generic = sum(a: 3.344, b: 4.77)
        let generic2 = sum(a: 5, b: 5)
        
        let value = sumInt(a: 3, b: 7)
        print(value)
        
        let value2 = sumDouble(a: 3.5, b: 7.7)
        print(value2)
    }


}
