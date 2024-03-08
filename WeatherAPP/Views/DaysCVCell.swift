//
//  DaysCVCell.swift
//  WeatherAPP
//
//  Created by Hamza Javaid on 07/03/2024.
//

import UIKit

class DaysCVCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var avrageTemp: UILabel!
    @IBOutlet weak var bgView: UIView!

    
    var hour: Hour? {
        didSet {
            let dayOrNight: DayNight = (hour?.is_day ?? 1) == 1 ? .day : .night
            img.image = WeatherIconHelper.getWeatherIcon(forCode: hour?.condition?.code ?? 0, dayNight:  dayOrNight)
            let epochTime: TimeInterval = TimeInterval(hour?.time_epoch ?? 0 )
            let date = Date(timeIntervalSince1970: epochTime)
            dateLbl.text = date.formattedHourString()
            avrageTemp.text = String(hour?.temp_c ?? 0) + "°"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = bgView.bounds.width / 2
    }

}
