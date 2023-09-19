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
    
    let resultLabel = {
        let view = UILabel()
        view.text = "테스트테스트테스트테스트테스트테스트테스트"
        view.numberOfLines = 2
        view.font = .systemFont(ofSize: 15, weight: .heavy)
        view.textAlignment = .center
        view.textColor = .systemYellow
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
        view.tag = LoginTextField.location.tag
        return view
    }()
    
    let recommendationTextField = {
        let view = GrayBackgroundTextField()
        view.setPlaceholder(LoginTextField.recommendation.placeHolder)
        view.tag = LoginTextField.recommendation.tag
        return view
    }()
    
    let signUpButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
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

    @objc func signUpButtonClicked() {
        print("로그인버튼 클릭")
        
        viewModel.signIn {
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let vc = NetflixMainViewController()
            
            sceneDelegate?.window?.rootViewController = vc
            sceneDelegate?.window?.makeKeyAndVisible()
        }
        
    }
    
    @objc func textFieldChanged(_ sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        switch sender.tag {
        case LoginTextField.email.tag:
            viewModel.email.value = text
            viewModel.checkValidation(text: text, regex: ValidationError.invalidEmail.regex, index: 0, error: ValidationError.invalidEmail, emptyError: ValidationError.emptyString.errorMessage, messge: ValidationError.invalidEmail.errorMessage)
            
        case LoginTextField.password.tag:
            viewModel.password.value = text
            viewModel.checkValidation(text: text, regex: ValidationError.invalidPassword.regex, index: 1, error: ValidationError.invalidPassword, emptyError: ValidationError.emptyString.errorMessage, messge: ValidationError.invalidPassword.errorMessage)
            
        case LoginTextField.nickname.tag:
            viewModel.nickname.value = text
            viewModel.checkValidation(text: text, regex: ValidationError.invalidNickname.regex, index: 2, error: ValidationError.invalidNickname, emptyError: ValidationError.emptyString.errorMessage, messge: ValidationError.invalidNickname.errorMessage)
            
        case LoginTextField.location.tag:
            viewModel.location.value = text
            viewModel.checkValidation(text: text, regex: ValidationError.invalidlocation.regex, index: 3, error: ValidationError.invalidlocation, emptyError: ValidationError.emptyString.errorMessage, messge: ValidationError.invalidlocation.errorMessage)
            
        case LoginTextField.recommendation.tag:
            viewModel.recommendation.value = text
            viewModel.checkValidation(text: text, regex: ValidationError.invalidCode.regex, index: 4, error: ValidationError.invalidCode, emptyError: ValidationError.emptyString.errorMessage, messge: ValidationError.invalidCode.errorMessage)
        default: break
        }
        
        viewModel.checkEverything()
    }
    
    func configure() {
        
        backgroundColor = .black
        
        viewModel.isValid.bind { bool in
            self.signUpButton.isEnabled = bool
            self.signUpButton.backgroundColor = bool ? .red : .lightGray
            if self.viewModel.isValid.value {
                self.signUpButton.setTitleColor(.white, for: .normal)
            } else {
                self.signUpButton.setTitleColor(.darkGray, for: .normal)
            }
        }

        viewModel.email.bind { text in
            self.emailTextField.text = text
        }
        
        viewModel.password.bind { text in
            self.passwordTextField.text = text
        }
        
        viewModel.nickname.bind { text in
            self.nicknameTextField.text = text
        }
        
        viewModel.location.bind { text in
            self.locationTextField.text = text
        }
        
        viewModel.recommendation.bind { text in
            self.recommendationTextField.text = text
        }
        
        viewModel.result.bind { value in
            self.resultLabel.text = value
        }
        
        let list = [titleLabel, emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendationTextField, signUpButton, redSwitch, addInfoLabel, resultLabel]
        list.forEach {
            addSubview($0) }
        
        [emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendationTextField].forEach { $0.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged) }
        
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
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
        
        resultLabel.snp.makeConstraints { make in
            make.bottom.equalTo(emailTextField.snp.top).offset(-25)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        
    }
    
}
