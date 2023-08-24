//
//  NetflixViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit
import SnapKit

class NetflixViewController: UIViewController {
    
    let titleLabel = {
        let view = UILabel()
        view.text = "NETFLIX"
        view.font = .boldSystemFont(ofSize: 40)
        view.textColor = .red
        view.textAlignment = .center
        return view
    }()
    
    let addInfoLabel = {
        let view = UILabel()
        view.text = "추가 정보 입력"
        view.font = .systemFont(ofSize: 15)
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    let emailTextField = {
        let view = GrayBackgroundTextField()
        view.setTextField("이메일 또는 전화번호")
        return view
    }()
    
    let  passwordTextField = {
        let view = GrayBackgroundTextField()
        view.setTextField("비밀번호")
        return view
    }()
    
    let nicknameTextField = {
        let view = GrayBackgroundTextField()
        view.setTextField("닉네임")
        return view
    }()
    
    let locationTextField = {
        let view = GrayBackgroundTextField()
        view.setTextField("위치")
        return view
    }()
    
    let recommendationTextField = {
        let view = GrayBackgroundTextField()
        view.setTextField("추천 코드 입력")
        return view
    }()
    
    let signUpButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        view.setTitleColor(UIColor.black, for: .normal)
        view.setTitle("회원가입", for: .normal)
        return view
    }()
    
    let redSwitch = {
        let view = UISwitch()
        view.isOn = false
        view.onTintColor = .red
        return view
    }()

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

//MARK: - UI extention
extension NetflixViewController {
    
    func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.horizontalEdges.equalTo(titleLabel)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(titleLabel)
            make.height.equalTo(emailTextField)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(titleLabel)
            make.height.equalTo(emailTextField)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(titleLabel)
            make.height.equalTo(emailTextField)
        }
        
        recommendationTextField.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(titleLabel)
            make.height.equalTo(emailTextField)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(recommendationTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(titleLabel)
            make.height.equalTo(55)
        }
        
        redSwitch.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(10)
            make.trailing.equalTo(signUpButton.snp.trailing)
        }
        
        addInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(redSwitch)
            make.leading.equalTo(signUpButton.snp.leading)
        }
        
    }
    
    func setUI() {
        
        view.backgroundColor = .black
        
        let list = [titleLabel, emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendationTextField, signUpButton, redSwitch, addInfoLabel]
        list.forEach { view.addSubview($0) }
        
        setConstraints()
    }
    
}
