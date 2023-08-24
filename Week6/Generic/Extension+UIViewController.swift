//
//  Extension+UIViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/24.
//

import UIKit

extension UIViewController {
    
    //Generic: 타입에 유연하게 대응하기 위한 요소
    //코드 중복과 재사용에 대응하기 좋아서 추상적인 표현 가능
    
    enum TransitionStyle {
        case present //네비 없이
        case presentNavigation //네비 있는 present
        case presentFullNavigation //네비 있는 fullscreen present
        case push //푸쉬
    }
    
    /*
     "고래밥" -> String
     String -> String.self 매개변수나 그 값을 쓰게되는 경우 -> String.Type 그 자체
     
     1. <T: UIViewController>
     1. viewController: T.Type
     2. String(describing: viewController)
     4. ~ as? T else ~
     */
    //transition(viewController: GenericViewController.self, storyboard: "Main", style: .present) - 뷰컨에서 쓴 코드
    
    func transition<T: UIViewController>(viewController: T.Type, storyboard: String, style: TransitionStyle) {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else { return }
        
        present(vc, animated: true)
        
        switch style {
        case .present:
            present(vc, animated: true)
            
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
            
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
//    func transition(storyboard: String, style: TransitionStyle) { //제네릭 사용 전 이넘과 조합
//        let sb = UIStoryboard(name: storyboard, bundle: nil)
//        guard let vc = sb.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
//
//        present(vc, animated: true)
//
//        switch style {
//        case .present:
//            present(vc, animated: true)
//
//        case .presentNavigation:
//            let nav = UINavigationController(rootViewController: vc)
//            present(nav, animated: true)
//
//        case .presentFullNavigation:
//            let nav = UINavigationController(rootViewController: vc)
//            nav.modalPresentationStyle = .fullScreen
//            present(nav, animated: true)
//
//        case .push:
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
    
//    func transition() { //기존에 쓰던 코드
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        guard let vc = sb.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
//
//        present(vc, animated: true)
//    }
    
    //-------------------------------------------------
    
    //T(Type Parameter): 빈 박스다~ 타입의 종류는 알려주지 않지만, 모두 같은 타입이 들어갈 것을 암시. 플레이스 홀더와 같은 역할
    //Type Constraints(타입 제약 설정): 클래스 제약, 프로토콜 제약
    //U(UpperCased): 타입 파라미터가 여러 개가 된다면 2번째로 많이 쓰는 건 U!
    func configureBorder<T: UIView>(view: T) { //원랜 밑과 같은 코드를 이렇게! 타입 제약은 최소한의 값. 인트를 굴릴 순 없으니까
        view.layer.cornerRadius = 7
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    
//    func configureBorder(view: UIButton) {
//        
//    }
//    
//    func configureBorder(view: UITextField) {
//        
//    }
    
    //-------------------------------------------------
    
    //AdditiveArithmetic: 덧셈이 가능한 타입만 쓰겠다고 프로포콜 채택
    func sum<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }
    
//    func sum<T, U>(a: T, b: T) -> U { //반환 값이 다른타입이라면 이렇게
//        return a + b
//    }
    
    //비슷한 메소드들... 타입만 바뀌구... 이런 코드가 여러 개가 된다면 너무 비효율적임!!
    func sumInt(a: Int, b: Int) -> Int { //복잡한 코드라고 생각해보자..!
        return a + b
    }
    
    func sumDouble(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func sumFloat(a: Float, b: Float) -> Float {
        return a + b
    }
    
}
