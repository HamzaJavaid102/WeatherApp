//
//  WeatherIconHelper.swift
//  WeatherAPP
//
//  Created by Hamza Javaid on 08/03/2024.
//

import Foundation
import UIKit

enum DayNight {
    case day
    case night
}

class WeatherIconHelper {
    static func getWeatherIcon(forCode code: Int, dayNight: DayNight) -> UIImage? {
        let iconName: String
        
        switch code {
        case 1000: iconName = "113" // Sunny
        case 1003: iconName = "116" // Partly cloudy
        case 1006: iconName = "119" // Cloudy
        case 1009: iconName = "122" // Overcast
        case 1030: iconName = "143" // Mist
        case 1063: iconName = "176" // Patchy rain possible
        case 1066: iconName = "179" // Patchy snow possible
        case 1069: iconName = "182" // Patchy sleet possible
        case 1072: iconName = "185" // Patchy freezing drizzle possible
        case 1087: iconName = "200" // Thundery outbreaks possible
        case 1114: iconName = "227" // Blowing snow
        case 1117: iconName = "230" // Blizzard
        case 1135: iconName = "248" // Fog
        case 1147: iconName = "260" // Freezing fog
        case 1150: iconName = "263" // Patchy light drizzle
        case 1153: iconName = "266" // Light drizzle
        case 1168: iconName = "281" // Freezing drizzle
        case 1171: iconName = "284" // Heavy freezing drizzle
        case 1180: iconName = "293" // Patchy light rain
        case 1183: iconName = "296" // Light rain
        case 1186: iconName = "299" // Moderate rain at times
        case 1189: iconName = "302" // Moderate rain
        case 1192: iconName = "305" // Heavy rain at times
        case 1195: iconName = "308" // Heavy rain
        case 1198: iconName = "311" // Light freezing rain
        case 1201: iconName = "314" // Moderate or heavy freezing rain
        case 1204: iconName = "317" // Light sleet
        case 1207: iconName = "320" // Moderate or heavy sleet
        case 1210: iconName = "323" // Patchy light snow
        case 1213: iconName = "326" // Light snow
        case 1216: iconName = "329" // Patchy moderate snow
        case 1219: iconName = "332" // Moderate snow
        case 1222: iconName = "335" // Patchy heavy snow
        case 1225: iconName = "338" // Heavy snow
        case 1237: iconName = "350" // Ice pellets
        case 1240: iconName = "353" // Light rain shower
        case 1243: iconName = "356" // Moderate or heavy rain shower
        case 1246: iconName = "359" // Torrential rain shower
        case 1249: iconName = "362" // Light sleet showers
        case 1252: iconName = "365" // Moderate or heavy sleet showers
        case 1255: iconName = "368" // Light snow showers
        case 1258: iconName = "371" // Moderate or heavy snow showers
        case 1261: iconName = "374" // Light showers of ice pellets
        case 1264: iconName = "377" // Moderate or heavy showers of ice pellets
        case 1273: iconName = "386" // Patchy light rain with thunder
        case 1276: iconName = "389" // Moderate or heavy rain with thunder
        case 1279: iconName = "392" // Patchy light snow with thunder
        case 1282: iconName = "395" // Moderate or heavy snow with thunder
            
            // Default case for unknown codes
        default: iconName = "rain_cloud_sun"
        }
        let folderName = (dayNight == .day) ? "_day" : "_night"
        let imageName = "\(iconName)\(folderName)"
        
        if let iconImage = UIImage(named: imageName) {
            return iconImage
        } else {
            return UIImage(named: "default_icon")
        }
    }
}
