/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Hour : Codable {
	let time_epoch : Int?
	let time : String?
	let temp_c : Double?
	let is_day : Int?
	let condition : Condition?
	let wind_mph : Double?
	let snow_cm : Double?
	let humidity : Int?
	let cloud : Int?
	let feelslike_c : Double?
	let windchill_c : Double?
	let heatindex_c : Double?
	let dewpoint_c : Double?
	let will_it_rain : Int?
	let chance_of_rain : Int?
	let will_it_snow : Int?
	let chance_of_snow : Int?
	let vis_miles : Double?
	let gust_mph : Double?
	let uv : Double?
	let short_rad : Double?
	let diff_rad : Double?

	enum CodingKeys: String, CodingKey {

		case time_epoch = "time_epoch"
		case time = "time"
		case temp_c = "temp_c"
		case is_day = "is_day"
		case condition = "condition"
		case wind_mph = "wind_mph"
		case snow_cm = "snow_cm"
		case humidity = "humidity"
		case cloud = "cloud"
		case feelslike_c = "feelslike_c"
		case windchill_c = "windchill_c"
		case heatindex_c = "heatindex_c"
		case dewpoint_c = "dewpoint_c"
		case will_it_rain = "will_it_rain"
		case chance_of_rain = "chance_of_rain"
		case will_it_snow = "will_it_snow"
		case chance_of_snow = "chance_of_snow"
		case vis_miles = "vis_miles"
		case gust_mph = "gust_mph"
		case uv = "uv"
		case short_rad = "short_rad"
		case diff_rad = "diff_rad"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		time_epoch = try values.decodeIfPresent(Int.self, forKey: .time_epoch)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		temp_c = try values.decodeIfPresent(Double.self, forKey: .temp_c)
		is_day = try values.decodeIfPresent(Int.self, forKey: .is_day)
		condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
		wind_mph = try values.decodeIfPresent(Double.self, forKey: .wind_mph)
		snow_cm = try values.decodeIfPresent(Double.self, forKey: .snow_cm)
		humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
		cloud = try values.decodeIfPresent(Int.self, forKey: .cloud)
		feelslike_c = try values.decodeIfPresent(Double.self, forKey: .feelslike_c)
		windchill_c = try values.decodeIfPresent(Double.self, forKey: .windchill_c)
		heatindex_c = try values.decodeIfPresent(Double.self, forKey: .heatindex_c)
		dewpoint_c = try values.decodeIfPresent(Double.self, forKey: .dewpoint_c)
		will_it_rain = try values.decodeIfPresent(Int.self, forKey: .will_it_rain)
		chance_of_rain = try values.decodeIfPresent(Int.self, forKey: .chance_of_rain)
		will_it_snow = try values.decodeIfPresent(Int.self, forKey: .will_it_snow)
		chance_of_snow = try values.decodeIfPresent(Int.self, forKey: .chance_of_snow)
		vis_miles = try values.decodeIfPresent(Double.self, forKey: .vis_miles)
		gust_mph = try values.decodeIfPresent(Double.self, forKey: .gust_mph)
		uv = try values.decodeIfPresent(Double.self, forKey: .uv)
		short_rad = try values.decodeIfPresent(Double.self, forKey: .short_rad)
		diff_rad = try values.decodeIfPresent(Double.self, forKey: .diff_rad)
	}

}