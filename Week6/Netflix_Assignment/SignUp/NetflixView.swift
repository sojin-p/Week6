//
//  NetflixView.swift
//  Week6
//
//  Created by 박소진 on 2023/09/12.
//

import UIKit
import SnapKit

class NetflixView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        view.setPlaceholder(LoginTextField.email.placeHolder)
        view.tag = LoginTextField.email.tag
        return view
    }()
    
    let  passwordTextField = {
        let view = GrayBackgroundTextField()
        view.setPlaceholder(LoginTextField.password.placeHolder)
        view.tag = LoginTextField.password.tag
        return view
    }()
    
    let nicknameTextField = {
        let view = GrayBackgroundTextField()
        view.setPlaceholder(LoginTextField.nickname.placeHolder)
        view.tag = LoginTextField.nickname.tag
        return view
    }()
    
    let locationTextField = {
        let view = GrayBackgroundTextField()
        view.setPlaceholder(LoginTextField.location.placeHolder)
        return view
    }()
    
    let recommendationTextField = {
        let view = GrayBackgroundTextField()
        view.setPlaceholder(LoginTextField.recommendation.placeHolder)
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
    
    var viewModel = NetfixViewModel()
    
    enum LoginTextField {
        case email
        case password
        case nickname
        case location
        case recommendation
        
        var placeHolder: String {
            switch self {
            case .email: return "이메일 또는 전화번호"
            case .password: return "비밀번호"
            case .nickname: return "닉네임"
            case .location: return "위치"
            case .recommendation: return "추천 코드"
            }
        }
        
        var tag: Int {
            switch self {
            case .email: return 0
            case .password: return 1
            case .nickname: return 2
            case .location: return 3
            case .recommendation: return 4
            }
        }
    }
    
    @objc func textFieldChanged(_ sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        switch sender.tag {
        case LoginTextField.email.tag:
            viewModel.email.value = text
            print("이메일", text)
            
        case LoginTextField.password.tag:
            viewModel.password.value = text
            print("비번", text)
            
        case LoginTextField.nickname.tag:
            viewModel.nickname.value = text
            print("닉네임", text)
            
        default: print("디폴트")
        }
        
    }
    
    func configure() {
        
        backgroundColor = .black
        
        let list = [titleLabel, emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendationTextField, signUpButton, redSwitch, addInfoLabel]
        list.forEach {
            addSubview($0) }
        
        [emailTextField, passwordTextField, nicknameTextField].forEach { $0.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged) }
        
    }
    
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
    
}
