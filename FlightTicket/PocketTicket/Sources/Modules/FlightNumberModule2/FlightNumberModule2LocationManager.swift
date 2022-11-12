//
//  FlightNumberModule2LocationManager.swift
//  PocketTicket
//
//  Created by Vasiliy on 10.11.2022.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("DEBUG: Not determined")
        case .restricted:
            print("DEBUG: Not determined")
        case .denied:
            print("DEBUG: Not determined")
        case .authorizedAlways:
            print("DEBUG: Not determined")
        case .authorizedWhenInUse:
            print("DEBUG: Not determined")
        case .authorized:
            print("DEBUG: Not determined")
        @unknown default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
    
}

