/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Day : Codable {
	let maxtemp_c : Double?
	let mintemp_c : Double?
	let avgtemp_c : Double?
	let maxwind_mph : Double?
	let totalprecip_mm : Double?
	let totalprecip_in : Double?
	let totalsnow_cm : Double?
	let avgvis_miles : Double?
	let avghumidity : Int?
	let daily_will_it_rain : Int?
	let daily_chance_of_rain : Int?
	let daily_will_it_snow : Int?
	let daily_chance_of_snow : Int?
	let condition : Condition?
	let uv : Double?

	enum CodingKeys: String, CodingKey {

		case maxtemp_c = "maxtemp_c"
		case mintemp_c = "mintemp_c"
		case avgtemp_c = "avgtemp_c"
		case maxwind_mph = "maxwind_mph"
		case totalprecip_mm = "totalprecip_mm"
		case totalprecip_in = "totalprecip_in"
		case totalsnow_cm = "totalsnow_cm"
		case avgvis_miles = "avgvis_miles"
		case avghumidity = "avghumidity"
		case daily_will_it_rain = "daily_will_it_rain"
		case daily_chance_of_rain = "daily_chance_of_rain"
		case daily_will_it_snow = "daily_will_it_snow"
		case daily_chance_of_snow = "daily_chance_of_snow"
		case condition = "condition"
		case uv = "uv"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		maxtemp_c = try values.decodeIfPresent(Double.self, forKey: .maxtemp_c)
		mintemp_c = try values.decodeIfPresent(Double.self, forKey: .mintemp_c)
		avgtemp_c = try values.decodeIfPresent(Double.self, forKey: .avgtemp_c)
		maxwind_mph = try values.decodeIfPresent(Double.self, forKey: .maxwind_mph)
		totalprecip_mm = try values.decodeIfPresent(Double.self, forKey: .totalprecip_mm)
		totalprecip_in = try values.decodeIfPresent(Double.self, forKey: .totalprecip_in)
		totalsnow_cm = try values.decodeIfPresent(Double.self, forKey: .totalsnow_cm)
		avgvis_miles = try values.decodeIfPresent(Double.self, forKey: .avgvis_miles)
		avghumidity = try values.decodeIfPresent(Int.self, forKey: .avghumidity)
		daily_will_it_rain = try values.decodeIfPresent(Int.self, forKey: .daily_will_it_rain)
		daily_chance_of_rain = try values.decodeIfPresent(Int.self, forKey: .daily_chance_of_rain)
		daily_will_it_snow = try values.decodeIfPresent(Int.self, forKey: .daily_will_it_snow)
		daily_chance_of_snow = try values.decodeIfPresent(Int.self, forKey: .daily_chance_of_snow)
		condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
		uv = try values.decodeIfPresent(Double.self, forKey: .uv)
	}

}