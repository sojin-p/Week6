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
        
        setAnnotation(type: .all)
        
    }
    
    @objc func filterButtonClicked() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let maga = UIAlertAction(title: "메가박스", style: .default) { action in
            self.setAnnotation(type: .mega)
        }
        let lotte = UIAlertAction(title: "롯데시네마", style: .default) { action in
            self.setAnnotation(type: .lotte)
        }
        let cgv = UIAlertAction(title: "CGV", style: .default) { action in
            self.setAnnotation(type: .cgv)
        }
        let all = UIAlertAction(title: "전체보기", style: .default) { action in
            self.setAnnotation(type: .all)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(maga)
        alert.addAction(lotte)
        alert.addAction(cgv)
        alert.addAction(all)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    //MARK: - Annotation
    func setRegionAndAnnotation(title:String, center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
    }
    
    func setAnnotation(type: TheaterList.TheaterType) {
        
        switch type {
        case .all:
            
            for i in TheaterList.mapAnnotations {
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: i.latitude, longitude: i.longitude)
                
                mapView.addAnnotations([annotation])
            }
            
        case .mega:
            mapView.removeAnnotations(mapView.annotations)
            filterAnnotation(count: 4)
            
        case .lotte:
            mapView.removeAnnotations(mapView.annotations)
            filterAnnotation(count: 5)
            
        case .cgv:
            mapView.removeAnnotations(mapView.annotations)
            filterAnnotation(count: 3)
        }
        
    }
    
    func filterAnnotation(count: Int) {
        TheaterList.mapAnnotations.filter { $0.type.count == count }.map {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
            mapView.addAnnotations([annotation])
        }
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
            
            let center = CLLocationCoordinate2D(latitude: 37.517748, longitude: 126.886374) //새싹
            setRegionAndAnnotation(title: "새싹 영등포캠퍼스", center: center)
            
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
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(title: "현 위치", center: coordinate)
        }
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
        
        setRightBarButton()
        
        locationManager.delegate = self
        view.backgroundColor = .white
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonClicked))
    }
}
