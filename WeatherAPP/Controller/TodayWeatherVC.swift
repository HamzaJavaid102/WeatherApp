//
//  TodayWeatherVC.swift
//  WeatherAPP
//
//  Created by Hamza Javaid on 07/03/2024.
//

import UIKit

class TodayWeatherVC: UIViewController {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var conditionLbl: UILabel!
    
    private var currentCity: String?
    
    let viewModel = WeatherVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        viewModel.locationUpdateHandler = { location in
            self.currentCity = location
            self.cityNameLbl.text = location
            self.getCurrentWeatherData()
        }
    }
    
    private func getCurrentWeatherData() {
        guard let city = currentCity else { return }
        self.viewModel.getCurrentWeather(location: city ) { [weak self] errorMessage in
            if let errorMsg = errorMessage {
                print(errorMsg)
                return;
            }
            self?.setupData() 
        }
    }
    
    private func setupData() {
        let currentWeather = viewModel.currentWeather
        cityNameLbl.text = currentWeather?.location?.name ?? "NA"
        tempLbl.text = "\(currentWeather?.current?.temp_c ?? 0.0)"
        conditionLbl.text = currentWeather?.current?.condition?.text ?? ""
    }
    
    
}

extension TodayWeatherVC {
    
    @IBAction func refreshTapped(_ sender: UIButton) {
        getCurrentWeatherData()
    }
    
    
}
