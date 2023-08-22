//
//  FirstExampleViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/22.
//

import UIKit

class FirstExampleViewController: UIViewController {
    
    let grayView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var titleTextField = setTextField("제목을 입력해주세요")
    
    lazy var dateTextField = setTextField("날짜를 입력해주세요")
    
    let whiteView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
    }
    
    func setUI() {
        [grayView, titleTextField, dateTextField, whiteView].forEach { view.addSubview($0) }
        setConstraints()
        view.backgroundColor = .white
    }
    
    func setConstraints() {
        grayView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(grayView.snp.horizontalEdges)
            make.height.equalTo(45)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(titleTextField.snp.horizontalEdges)
            make.height.equalTo(titleTextField)
        }
        
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(dateTextField.snp.horizontalEdges)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setTextField(_ placeholder: String) -> UITextField {
        let view = UITextField()
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.black.cgColor
        view.textAlignment = .center
        view.placeholder = placeholder
        return view
    }

}
