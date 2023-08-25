//
//  CustomTableViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit
import SnapKit

//6.
struct Sample {
    let text: String
    var isExpand: Bool
}

class CustomTableViewController: UIViewController {
    
    //viewDidLoad보다 클로저 구문이 먼저 실행이 됨
    //CustomTableViewController 인스턴스 생성 직전에 클로저 구문이 우선 실행
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension //1. 오토매틱 디맨션
        
        view.delegate = self //self는 자기 자신(해당 클래스)의 인스턴스를 의미
        view.dataSource = self
        
        //uinib - xib 파일이 없으니 nib이름을 쓸 필요가 없고, 셀 그 자체를 가지고 온다.
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        return view
    }()
    
    let imageView = {
        let view = PosterImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    }()
    
    //var isExpand = false //4. false = 2, true = 무한대로늘려주기
    var list = [
        Sample(text: "test", isExpand: false),
        Sample(text: "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest", isExpand: false),
        Sample(text: "텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트", isExpand: false),
        Sample(text: "!@#$@#%$^@#$#$@", isExpand: false),
        Sample(text: "ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나ㅇㄴ런훔능린;ㅡㄹ니ㅏㅡㅇ느미으ㅜ이ㅏ무랓므ㅏ니ㅡ미ㅏ너읓미나", isExpand: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            print("레이아웃은 언제 실행되나")
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        
    }
    
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.label.text = list[indexPath.row].text
        cell.label.numberOfLines = list[indexPath.row].isExpand ? 0 : 2 //2. //6.
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //5.
//        isExpand.toggle()
        list[indexPath.row].isExpand.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
//        tableView.reloadRows(at: [IndexPath(row: <#T##Int#>, section: <#T##Int#>)], with: .none) 특정해서 갱신
    }
    
}
