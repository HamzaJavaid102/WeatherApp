//
//  WeatherVM.swift
//  WeatherAPP
//
//  Created by Hamza Javaid on 07/03/2024.
//

import Foundation
import CoreLocation

class WeatherVM: NSObject {
    
    private var locationManager = CLLocationManager()
    var currentWeather: CurrentWeatherResponse?
    var locationUpdateHandler: ((String) -> Void)?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    deinit {
        locationManager.stopUpdatingLocation()
    }
}

extension WeatherVM {
    
    func getCurrentWeather(location: String,completion: @escaping(String?) -> Void) {
        let request = CurrentWeatherRequest(key: Constant.apiKey, q: location)
        APIClient.shared.request(path: .current(request)) { (result: Result<CurrentWeatherResponse?>) in
            switch result {
            case .success(let value):
                guard let data = value else { completion(Constant.Error.noData) ; return}
                self.currentWeather = data
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
}


extension WeatherVM: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Reverse geocoding error: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first, let cityName = placemark.locality else {
                print("City name not found")
                return
            }
            self.locationUpdateHandler?(cityName)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error: \(error.localizedDescription)")
    }
}
