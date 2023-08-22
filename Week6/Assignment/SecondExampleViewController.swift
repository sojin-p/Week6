//
//  SecondExampleViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/22.
//

import UIKit

class SecondExampleViewController: UIViewController {
    
    let backIamgeView = setImageView(.darkGray, false)
    
    let closeButton = setButton("xmark", 20)
    let giftButton = setButton("gift.circle", 25)
    let qrButton = setButton("circle.grid.3x3.circle", 25)
    let settingButton = setButton("gearshape.circle", 25)
    
    let profileImageView = setImageView(.gray, true)
    let profileTitleLabel = {
        let label = UILabel()
        label.text = "테스트"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    let profileSubTitleLabel = {
        let label = UILabel()
        label.text = "서브텍스트"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    let lineView = setImageView(.white, false)
    
    let chatButton = setButton("message.fill", 50)
    let editButton = setButton("pencil", 50)
    let storyButton = setButton("quote.closing", 50)
    
    let chatLabel = setLabel("나와의 채팅")
    let editLabel = setLabel("프로필 편집")
    let storyLabel = setLabel("카카오스토리")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
    }
    
    func setConstraints() {
        
        backIamgeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.size.equalTo(55)
            make.leading.equalToSuperview()
        }
        
        settingButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(closeButton)
            make.size.equalTo(closeButton)
        }
        
        qrButton.snp.makeConstraints { make in
            make.trailing.equalTo(settingButton.snp.leading).offset(15)
            make.centerY.equalTo(settingButton)
            make.size.equalTo(settingButton)
        }
        
        giftButton.snp.makeConstraints { make in
            make.trailing.equalTo(qrButton.snp.leading).offset(15)
            make.centerY.equalTo(qrButton)
            make.size.equalTo(qrButton)
        }
        
        editButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-60)
            make.size.equalTo(30)
        }
        
        editLabel.snp.makeConstraints { make in
            make.top.equalTo(editButton.snp.bottom).offset(8)
            make.centerX.equalTo(editButton)
        }
        
        chatButton.snp.makeConstraints { make in
            make.centerY.equalTo(editButton)
            make.trailing.equalTo(editButton.snp.leading).offset(-70)
            make.size.equalTo(editButton)
        }
        
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(chatButton.snp.bottom).offset(8)
            make.centerX.equalTo(chatButton)
        }
        
        storyButton.snp.makeConstraints { make in
            make.centerY.equalTo(editButton)
            make.leading.equalTo(editButton.snp.trailing).offset(70)
            make.size.equalTo(editButton)
        }
        
        storyLabel.snp.makeConstraints { make in
            make.top.equalTo(storyButton.snp.bottom).offset(8)
            make.centerX.equalTo(storyButton)
        }
        
        lineView.snp.makeConstraints { make in
            make.bottom.equalTo(editButton.snp.top).offset(-30)
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(backIamgeView)
        }
        
        profileSubTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(lineView.snp.top).offset(-40)
            make.centerX.equalTo(backIamgeView)
            make.horizontalEdges.equalTo(backIamgeView).inset(20)
        }
        
        profileTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(profileSubTitleLabel.snp.top).offset(-4)
            make.centerX.equalTo(profileSubTitleLabel)
            make.horizontalEdges.equalTo(backIamgeView).inset(20)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.bottom.equalTo(profileTitleLabel.snp.top).offset(-15)
            make.centerX.equalTo(profileTitleLabel)
            make.size.equalTo(100)
        }
        
    }
    
    func setUI() {
        
        let list = [backIamgeView, closeButton, giftButton, qrButton, settingButton,
                    profileImageView, profileTitleLabel, profileSubTitleLabel,
                    lineView, chatButton, editButton, storyButton, chatLabel, editLabel, storyLabel]
        
        for i in list {
            view.addSubview(i)
        }
        setConstraints()
        view.backgroundColor = .gray
        
    }
    
    static func setButton(_ imageName: String, _ size: CGFloat) -> UIButton {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: size, weight: .light)
        let image = UIImage(systemName: imageName, withConfiguration: imageConfig)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }
    
    static func setImageView(_ color: UIColor, _ radius: Bool) -> UIImageView {
        let view = UIImageView()
        if radius {
            view.layer.cornerRadius = 20
        }
        view.backgroundColor = color
        return view
    }
    
    static func setLabel(_ title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }

}
