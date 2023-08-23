//
//  LocationViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/22.
//

import UIKit
import CoreLocation //1. 위치 임포트

class LocationViewController: UIViewController {
    
    //2. 위치 매니저 인스턴스 생성: 위치에 대한 대부분(권한, 성공상태 등)을 담당함
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //3. 위치 프로토콜 연결
        locationManager.delegate = self
        
//        //info.plist <<< 얼럿
//        locationManager.requestWhenInUseAuthorization()
        
        //네비달았을 때 안켜지는 경우가 있음. 그래서 두번 호출되더라도 뷰디드로드에서 호출하기
//        checkDeviceLocationAutorization()
        
    }
    
    //7-1.
    func checkDeviceLocationAutorization() { //아이폰 설정에서 확인할 수 있는 위치서비스 체크하는 메서드
        
        DispatchQueue.global().async {
            //iOS 위치 서비스 활성화 체크
            if CLLocationManager.locationServicesEnabled() {
                
                //현재 사용자의 위치 권한 상태를 갖고 옴
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                self.checkCurrentLocationAuthorization(status: authorization)
                
            } else {
                print("위치 서비스가 꺼져있어 위치 권한 요청을 못합니다 - 얼럿으로 대응")
            }
        }
        
    }
    
    //7-2.
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        
        print("check",status)
        
        switch status {
        case .notDetermined: //권한에 대한 요청을 띄워야 함(결정이 안 났으니)
            locationManager.desiredAccuracy = kCLLocationAccuracyBest //위치에 대한 업뎃 정확도(민감도) 설정
            locationManager.requestWhenInUseAuthorization() //얼럿 띄워주는 역할, info.plist 설정과 맞아야 함!
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse: //허용되어있다면
            print("authorizedWhenInUse")
            //didUpdateLocation 메서드를 실행시켜줌
            locationManager.startUpdatingLocation() //사용자의 위치를 알려달라고 요청
        case .authorized:
            print("authorized")
        @unknown default: //위치 권한 종류가 더 생길 가능성 대비
            print("default")
        }
        
    }
    
} //VC

//4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    //8.
    //5. 사용자의 위치를 성공적으로 가져 온 경우(새로운 위치가 생겼을 때(위치가 바뀌었을 때) 알려준다) - didup~
    //   한 번만 실행되지 않는다. iOS 시스템상 위치 업데이트 필요 시점에 알아서 여러번 호출 됨
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("---",locations)
        
        //위경도 값 가져오기
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
        }
        
        //여러번 찍히니까 멈추라고 하기! 안 할 경우 배터리나 발열 등의 문제가.. 런데이는 끝낼 때 호출하겠징..?
        locationManager.stopUpdatingLocation()
        
    } //위치 업데이트 기준을 설정하는 메서드가 있음(몇미터 등)
    
    
    //6. 사용자 위치 가져오기 실패한 경우(폰이 부서졌다든지, 허용한 걸 바로 거부로 껐든지 등) - didfail~
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    
    //7-3. 사용자 권한이 변경되었을 때 알려줌 - didchangeauth
    //ex)거부했다가 설정에서 변경했거나, notDetermined(허용할지말지 선택하지 않은)상태에서 허용을 했거나
    //   허용해서 위치를 가지고 오는 도중에 설정에서 거부하고 앱으로 다시 돌아오는 경우 등등 처음부터 뜬다!
    //iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function) //체크만 할 뿐이라
        checkDeviceLocationAutorization()
    }
    
    //7-3-2.
    //iOS14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}
