//
//  DaysCVCell.swift
//  WeatherAPP
//
//  Created by Hamza Javaid on 07/03/2024.
//

import UIKit

class DaysCVCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var condition: UILabel!
    
    var day: Forecastday? {
        didSet {
            img.image = UIImage(named: "rain_cloud_sun")
//            date.text = day?.day.
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
