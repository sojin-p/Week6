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

    let tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension //1. 오토매틱 디맨션
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //uinib - xib 파일이 없으니 nib이름을 쓸 필요가 없다.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = list[indexPath.row].text
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0 : 2 //2. //6.
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
