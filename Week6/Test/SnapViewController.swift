//
//  SnapViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/22.
//

import UIKit
import SnapKit

/*
 포인트:
 addSubView - 위치에 따라 레이어 순서가 바뀜
 superView - 객체가 속한 수퍼 뷰임!!!
 offset & inset - off~: 밀기 / in~: 안으로 넣기
 RTL(Right To Left) : 글씨를 오른쪽에서 쓰는 나라가 있음.(6억명) 모든것이 반전됨 아이콘 등등 다!
 리딩 트레일링과 레프트 라이트의 차이가 뭘까?
 - 아랍권 나라들은 리딩 트레일링을 바꾸면 오른쪽왼쪽이 바뀌어서 국가적 대응이 되지만,
 - 레프트라이트로 잡으면 진짜 왼쪽 오른쪽이라서 국가적 대응이 안됨
 */

class SnapViewController: UIViewController {
    
    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        //1.뷰 객체 부르고, makeConstraints
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(whiteView)
        whiteView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            make.leading.equalTo(view.safeAreaLayoutGuide)
//            make.trailing.equalTo(view.safeAreaLayoutGuide)
//            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide) //수평에 대한 엣지, 위에 두 개와 같다
            make.height.equalTo(200)
        }
        
        view.addSubview(blueView)
        blueView.snp.makeConstraints { make in
//            make.centerX.centerY.equalTo(view)
            make.center.equalTo(view) //위와 같다
//            make.height.width.equalTo(200)
            make.size.equalTo(200) //위와 같다
        }
        
//        view.addSubview(yellowView) //위치 바뀌면 레이어순서가 바뀜~!!!
        blueView.addSubview(yellowView) //블루 뷰 안에 넣기~!
        yellowView.snp.makeConstraints { make in
//            make.size.equalTo(150)
//            make.leading.top.equalToSuperview() //equalToSuperview: 객체가 속한 수퍼뷰임! 항상 디바이스 뷰가 아니다
            
//            make.leading.top.trailing.bottom.equalToSuperview() //네가지면을 수퍼뷰랑 같게
//            make.edges.equalToSuperview() //위와 같음
//            make.edges.equalTo(blueView) //좀 더 가독성 있는 위와같은 코드
//            make.edges.equalTo(blueView).offset(50) //오른밑으로 50씩 밀기
            make.edges.equalTo(blueView).inset(50) //안쪽으로 50씩 줄이기
        }
        
        view.backgroundColor = .lightGray
        redView.backgroundColor = .red
        whiteView.backgroundColor = .white
        blueView.backgroundColor = .blue
        yellowView.backgroundColor = .yellow
        
    }
    

}
