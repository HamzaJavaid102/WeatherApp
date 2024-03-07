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
    var errorUpdateHandler: ((String) -> Void)?
    
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
    
    func numberOfItems() -> Int {
        return currentWeather?.forecast?.forecastday?.first?.hour?.count ?? 0
    }
    
    func item(at index: Int) -> Hour? {
        return currentWeather?.forecast?.forecastday?.first?.hour?[index]
    }
}

extension WeatherVM {
    
    func getCurrentWeather(location: String,completion: @escaping(String?) -> Void) {
        let request = Next3DaysWeatherRequest(key: Constant.apiKey, q: location, days: "3")
        APIClient.shared.request(path: .forcast(request)) { (result: Result<CurrentWeatherResponse?>) in
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
                self.errorUpdateHandler?("Reverse geocoding error: \(error.localizedDescription)")
                print("Reverse geocoding error: \(error)")
                return
            }
            
            guard let placemark = placemarks?.first, let cityName = placemark.locality else {
                self.errorUpdateHandler?("City name not found")
                print("City name not found")
                return
            }
            self.locationUpdateHandler?(cityName)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.errorUpdateHandler?("Location manager error: \(error.localizedDescription)")
        print("Location manager error: \(error)")
    }
}
