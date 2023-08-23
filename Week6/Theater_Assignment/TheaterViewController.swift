//
//  TheaterViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/23.
//

import UIKit
import CoreLocation
import SnapKit

class TheaterViewController: UIViewController {
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        checkDeviceLocationAutorization()
        
        view.backgroundColor = .white

    }
    
    func checkDeviceLocationAutorization() {
        
        DispatchQueue.global().async {
            
            if CLLocationManager.locationServicesEnabled() {
                
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print("설정창에서 켜져있으니 현위치 함수 실행할 것임")
                DispatchQueue.main.async {
                    self.checkCurrentLocationAutorization(status: authorization)
                }
                
            } else {
                print("위치 서비스가 꺼져있어 권한 요청 못한다고 얼럿 띄우기")
                self.showRequestLocationServiceAlert()
            }
        }
        
    }
    
    func checkCurrentLocationAutorization(status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("사용할 권한도 변경도 없다. 자녀보호?")
        case .denied:
            print("거부됨")
            showRequestLocationServiceAlert()
        case .authorizedAlways:
            print("항상 허용")
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            print("앱을 사용하는 동안")
            locationManager.startUpdatingLocation()
        case .authorized:
            print("권한 부여되었지만, MacOS용인듯")
        default:
            showRequestLocationServiceAlert()
        }
        
    }
    
    func showRequestLocationServiceAlert() {
      let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
      let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
          if let appSetting = URL(string: UIApplication.openSettingsURLString) {
              UIApplication.shared.open(appSetting)
          }
      }
      let cancel = UIAlertAction(title: "취소", style: .default)
      requestLocationServiceAlert.addAction(cancel)
      requestLocationServiceAlert.addAction(goSetting)
      
      present(requestLocationServiceAlert, animated: true, completion: nil)
    }
    
}

extension TheaterViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 가져오기 실패")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("사용자 권한이 변경됨")
    }
    
}
