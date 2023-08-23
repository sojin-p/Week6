//
//  TheaterViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/23.
//

import UIKit
import CoreLocation
import SnapKit
import MapKit

class TheaterViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        checkDeviceLocationAutorization()
        
        setRegionAndAunotation()

    }
    
    func setRegionAndAunotation() {
        let center = CLLocationCoordinate2D(latitude: 37.549599, longitude: 126.965379)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "현 위치"
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
    }
    
    //MARK: - LocationAutorization
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

//MARK: - CLLocationManagerDelegate
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

//MARK: - SetUI
extension TheaterViewController {
    
    func setUI() {
        
        locationManager.delegate = self
        view.backgroundColor = .white
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
