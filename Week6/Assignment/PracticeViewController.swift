//
//  PracticeViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/22.
//

import UIKit
import SnapKit

class PracticeViewController: UIViewController {
    
    let profileImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        return view
    }()
    
    let profileTitleLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "testtesttesttesttest"
        label.textColor = .black
        return label
    }()
    
    let profileSubLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.text = "그냥 글소개"
        label.textColor = .gray
        return label
    }()
    
    let photoBackView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemMint
        view.clipsToBounds = true
        return view
    }()
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    let titleLabel = {
        let label = UILabel()
        label.text = "사진의 타이틀"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
    }
    
    func setUI() {
        
        for i in [profileImageView, profileTitleLabel, profileSubLabel, photoBackView] {
            view.addSubview(i)
        }
        
        [photoImageView, titleLabel].forEach { view.addSubview($0) }
        
        photoBackView.addSubview(photoImageView)
        photoBackView.addSubview(titleLabel)
        
        setConstraints()
        
        view.backgroundColor = .white
    }
    
    func setConstraints() {
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(50)
            make.centerX.equalTo(view)
            make.size.equalTo(100)
        }
        
        profileTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(15)
            make.centerX.equalTo(profileImageView)
            make.horizontalEdges.equalTo(view).inset(20)
        }
        
        profileSubLabel.snp.makeConstraints { make in
            make.top.equalTo(profileTitleLabel.snp.bottom).offset(15)
            make.centerX.equalTo(profileTitleLabel)
            make.horizontalEdges.equalTo(view).inset(20)
        }
        
        photoBackView.snp.makeConstraints { make in
            make.top.equalTo(profileSubLabel.snp.bottom).offset(15)
            make.size.equalTo(300)
            make.centerX.equalToSuperview()
        }
        
        photoImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        
    }

}
