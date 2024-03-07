//
//  TodayWeatherVC.swift
//  WeatherAPP
//
//  Created by Hamza Javaid on 07/03/2024.
//

import UIKit
import Kingfisher

class TodayWeatherVC: UIViewController {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var humidtyLbl: UILabel!
    @IBOutlet weak var feeelsLikeLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dateLbl: UILabel!
    
    private var currentCity: String?
    
    let viewModel = WeatherVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DaysCVCell.self, forCellWithReuseIdentifier: "DaysCVCell")
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
        tempLbl.text = "\(currentWeather?.current?.temp_c ?? 0.0)°"
        conditionLbl.text = currentWeather?.current?.condition?.text ?? ""
//        weatherImg.image = UIImage(named: "\(currentWeather?.current?.condition?.icon ?? 113)")
        weatherImg.kf.setImage(with: URL(string: API.baseUrl + (currentWeather?.current?.condition?.icon ?? "")), placeholder: UIImage(named: "rain_cloud_sun"))
        humidtyLbl.text = "Humidty: " + String(currentWeather?.current?.humidity ?? 0)
        feeelsLikeLbl.text = "FeelsLike: " + String(currentWeather?.current?.feelslike_c ?? 0) + "°"
        dateLbl.text = currentWeather?.location?.localtime ?? ""
        collectionView.reloadData()
    }
    
    
}

extension TodayWeatherVC {
    
    @IBAction func refreshTapped(_ sender: UIButton) {
        getCurrentWeatherData()
    }

}

extension TodayWeatherVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewModel.numberOfItems()
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysCVCell", for: indexPath) as! DaysCVCell
            let item = viewModel.item(at: indexPath.row)
            return cell
        }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        }
    
}
