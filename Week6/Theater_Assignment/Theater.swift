//
//  Theater.swift
//  Week6
//
//  Created by 박소진 on 2023/08/23.
//

import Foundation

struct Theater {
    let type: String
    let location: String
    let latitude: Double
    let longitude: Double
}

struct TheaterList {
    static let mapAnnotations: [Theater] = [
        Theater(type: "롯데시네마", location: "롯데시네마 용산", latitude: 37.532800, longitude: 126.959707),
        Theater(type: "CGV", location: "신촌 아트레온", latitude: 37.556575, longitude: 126.940292),
        Theater(type: "메가박스", location: "메가박스 신촌", latitude: 37.559769, longitude: 126.941903),
        Theater(type: "CGV", location: "CGV 명동", latitude: 37.563368, longitude: 126.982872),
        Theater(type: "롯데시네마", location: "롯데시네마 에비뉴엘", latitude: 37.564191, longitude: 126.981633),
        Theater(type: "CGV", location: "CGV 여의도", latitude: 37.525623, longitude: 126.925505),
        Theater(type: "롯데시네마", location: "롯데시네마 서울대입구", latitude: 37.4824761978647, longitude: 126.9521680487202),
        Theater(type: "롯데시네마", location: "롯데시네마 가산디지털", latitude: 37.47947929602294, longitude: 126.88891083192269),
        Theater(type: "메가박스", location: "메가박스 이수", latitude: 37.48581351541419, longitude:  126.98092132899579),
        Theater(type: "메가박스", location: "메가박스 강남", latitude: 37.49948523972615, longitude: 127.02570417165666),
        Theater(type: "CGV", location: "CGV 영등포", latitude: 37.52666023337906, longitude: 126.9258351013706),
        Theater(type: "CGV", location: "CGV 용산 아이파크몰", latitude: 37.53149302830903, longitude: 126.9654030486416)
    ]
    
    enum TheaterType {
        case all, mega, lotte, cgv
    }
}
