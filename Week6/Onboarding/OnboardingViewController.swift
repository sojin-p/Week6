//
//  OnboardingViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/25.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
}

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
    }
}

class OnboardingViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    //1. 인트로를 몇 개 쓸 지 배열 생성
    var list: [UIViewController] = []
    
    //페이지 넘김 스타일 바꿔보기
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2. 인스턴스
        list = [FirstViewController(), SecondViewController(), ThirdViewController()]
        
        view.backgroundColor = .darkGray
        
        //3. 부하직원
        delegate = self
        dataSource = self
        
        //5. 처음에 보여줄 화면 지정
        guard let first = list.first else { return }
        setViewControllers([first], direction: .forward, animated: true) //[first] <- 배열로, forward: 방향인 듯
//        setViewControllers([list[0]], direction: .forward, animated: true)

    }
    
    //4-1. Before 이전화면 준비
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //현재 사용자가 보고있는 뷰컨이 몇번째 index인지 알려줘
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        
        //보고 있는 화면의 이전 index를 알려줘
        let previousIndex = currentIndex - 1
        
        //이전화면 인덱스가 0보다 작으면 nil 아니면 이전인덱스 리턴
        return previousIndex < 0 ? nil : list[previousIndex]
        
    }
    
    //4-2. After 다음화면 준비
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = currentIndex + 1
        
        //다음화면 인덱스가 리스트 갯수를 넘어가면 nil
        return nextIndex >= list.count ? nil : list[nextIndex]
    }
    
    //5-2. Count 몇 개 준비할까
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
    
    //5-3. Index 페이지컨트롤 어디보고있는지 구멍 채우는 거 - 버티컬일 때도 안 나오고, 페이지컬일 때도 안 보임
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        //viewControllers: 페이지컨트롤러에 디스플레이된 뷰컨트롤러를 갖고 오는 것
        guard let first = viewControllers?.first, let index = list.firstIndex(of: first) else { return 0 } //디폴트는 0번 인덱스 채우기
        return index
    }

}
