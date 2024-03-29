//
//  CurrentWeatherRequest.swift
//  WeatherAPP
//
//  Created by Hamza Javaid on 07/03/2024.
//

import Foundation

struct CurrentWeatherRequest: BaseNetworkRequestable {
    let key: String
    let q: String
}

struct Next3DaysWeatherRequest: BaseNetworkRequestable {
    let key: String
    let q: String
    let days: String
}
