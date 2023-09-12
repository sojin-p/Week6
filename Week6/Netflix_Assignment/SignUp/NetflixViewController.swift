//
//  NetflixViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit

class NetflixViewController: UIViewController {
    
    let mainView = NetflixView()
    
    override func loadView() {
        self.view = mainView
    }

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
