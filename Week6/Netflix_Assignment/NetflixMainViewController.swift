//
//  NetflixMainViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit
import SnapKit

class NetflixMainViewController: UIViewController {
    
    let backImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let logoLabel = {
        let view = WhiteLabel()
        view.text = "N"
        view.font = .boldSystemFont(ofSize: 40)
        return view
    }()
    
    let tvLabel = setCategoriseLabel("TV 프로그램")
    let movieLabel = setCategoriseLabel("영화")
    let likeLabel = setCategoriseLabel("내가 찜한 콘텐츠")
    
    let likeButton = {
        let view = UIButton()
        view.setTitle("찜", for: .normal)
        view.setImage(UIImage(systemName: "star"), for: .normal)
        view.tintColor = .white
        return view
    }()
    let playButton = {
        let view = UIButton()
        view.setTitle("재생", for: .normal)
        view.setImage(UIImage(systemName: "star"), for: .normal)
        view.backgroundColor = .white
        view.tintColor = .black
        view.layer.cornerRadius = 7
        view.setTitleColor(UIColor.black, for: .normal)
        return view
    }()
    let infoButton = {
        let view = UIButton()
        view.setTitle("정보", for: .normal)
        view.setImage(UIImage(systemName: "star"), for: .normal)
        view.tintColor = .white
        return view
    }()
    
    let previewLabel = setCategoriseLabel("미리보기")
    
    let movie1Imageview = {
        let view = ColorRadiusImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return view
    }()
    let movie2Imageview = {
        let view = ColorRadiusImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return view
    }()
    let movie3Imageview = {
        let view = ColorRadiusImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return view
    }()

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()

    }
}

//MARK: - extestion
extension NetflixMainViewController {
    
    func setConstraints() {

        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(5)
        }
        
        tvLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoLabel)
            make.leading.equalTo(logoLabel.snp.trailing).offset(25)
            make.trailing.equalTo(movieLabel.snp.leading).offset(-25)
        }
        
        movieLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoLabel)
            make.centerX.equalToSuperview().offset(25)
        }
        
        likeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoLabel)
            make.leading.equalTo(movieLabel.snp.trailing).offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        movie2Imageview.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(100)
        }
        
        movie1Imageview.snp.makeConstraints { make in
            make.centerY.equalTo(movie2Imageview)
            make.trailing.equalTo(movie2Imageview.snp.leading).offset(-20)
            make.size.equalTo(movie2Imageview)
        }
        
        movie3Imageview.snp.makeConstraints { make in
            make.centerY.equalTo(movie2Imageview)
            make.leading.equalTo(movie2Imageview.snp.trailing).offset(20)
            make.size.equalTo(movie2Imageview)
        }
        
        previewLabel.snp.makeConstraints { make in
            make.leading.equalTo(movie1Imageview)
            make.bottom.equalTo(movie1Imageview.snp.top).offset(-10)
        }
        
        playButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.bottom.equalTo(previewLabel.snp.top).offset(-20)
        }
        
        likeButton.snp.makeConstraints { make in
            make.centerY.equalTo(playButton)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(playButton.snp.leading).offset(-20)
        }
        
        infoButton.snp.makeConstraints { make in
            make.centerY.equalTo(playButton)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(playButton.snp.trailing).offset(20)
        }
        
    }
    
    func setUI() {
        view.backgroundColor = .black
        
        let list = [backImageView, logoLabel, tvLabel, movieLabel, likeLabel, likeButton, playButton, infoButton, previewLabel, movie1Imageview, movie2Imageview, movie3Imageview]
        list.forEach { view.addSubview($0) }
        
        setConstraints()
    }
    
    static func setCategoriseLabel(_ text: String) -> UILabel {
        let view = WhiteLabel()
        view.font = .boldSystemFont(ofSize: 14)
        view.text = text
        return view
    }
}
