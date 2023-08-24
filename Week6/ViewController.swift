//
//  ViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/21.
//

import UIKit

//스토리보드로 했을 때 과정: 2.객체 얹고, 3.레이아웃 잡고, 1.아웃렛 연결, 4.속성 조절
//1. 뷰 객체 프로퍼티 선언(클래스 인스턴스 생성)
//2. 명시적으로 루트 뷰에 추가(객체 얹기) 레이어를 만드는.. (+ translatesAutoresizingMaskIntoConstraints)
//3. 크기와 위치(레이아웃)
//4. 속성 정의
//-> Frame 한계
//-> AutoResizingMask, AutoLayout -> 지금까지 스토리보드로 대응
//-> NSLayoutConstraints: 오토레이아웃을 코드로 짤 때 쓰는 클래스 -> 이제부터 코드로 대응
//   1. isActive 레이아웃 활성화(안 쓰면 컴파일 워닝 뜸)
//   2. addConstraints
//-> NSLayoutAnchor: 스냅킷에 내장되어있다고 함..!

class ViewController: UIViewController {
    
    //1.
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "메인화면"
        
        //2. 사용자 눈에 보여주기
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        //2-1. AutoResizingMask, AutoLayout을 같이 사용할 수 없음. 두개가 충돌해서 안보임
        //     3번인 AutoLayout을 적용할거라 AutoResizingMask를 끄겠다!(디폴트 true)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //3. Frame기반의 레이아웃
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        
        //4.
        emailTextField.backgroundColor = .blue
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "이메일을 입력해주세요"
        
        //3. attribute: .leading 왼쪽 여백 잡겠다. / toItem: 어디 기준? / relatedBy: .equal toItem과 같을거야 / multiplier: 비율 /constant: 얼마큼 띄워줄거야
        //-> isActive
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true // 마지막에 .isActive = true : 레이아웃에 대한 활성화
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true //오른쪽은 안쪽으로 들어와야하니까 마이너스!
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        
        //addConstraints
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50)
        
        view.addConstraints([leading, trailing, height, top]) //한 눈에 볼 수 있다.
        
        passwordTextField.backgroundColor = .yellow
        
        setLayoutAnchor()
        
    }
    @objc func signButtonClicked() {
        
        //제네릭 화면전환 적용!
        transition(viewController: GenericViewController.self, storyboard: "Main", style: .presentFullNavigation)
        
//        let vc = GenericViewController() //스토리보드 없을 때만 가능, 값 전달할 때 상수쓰지만
////        vc.modalTransitionStyle = .coverVertical
////        vc.modalPresentationStyle = .overFullScreen
////        let nav = UINavigationController(rootViewController: vc)
////        navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true) //그런거없으면 여기 VC란에 바로 인스턴스 생성해도 됨!
    }
    
    func setLayoutAnchor() {
        view.addSubview(signButton)
        signButton.translatesAutoresizingMaskIntoConstraints = false
        
        signButton.backgroundColor = .systemMint
        signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), //루트뷰의 엑스엥커랑 같다
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor) //safeAreaLayoutGuide가 없으면 밑에 딱 붙음
        ])
    }


}

