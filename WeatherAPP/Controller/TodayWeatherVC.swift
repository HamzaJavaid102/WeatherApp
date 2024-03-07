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
    @IBOutlet weak var maxTempLbl: UILabel!
    @IBOutlet weak var lowtempLbl: UILabel!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    private var currentCity: String?
    
    let viewModel = WeatherVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DaysCVCell", bundle: nil), forCellWithReuseIdentifier: "DaysCVCell")
        viewModel.locationUpdateHandler = { location in
            self.currentCity = location
            self.cityNameLbl.text = location
            self.getCurrentWeatherData()
        }
        
        viewModel.errorUpdateHandler = { errorMessage in
            self.presentAlert(title: Constant.Error.error, message: errorMessage)
        }
    }
    
    private func getCurrentWeatherData() {
        guard let city = currentCity else { return }
        indicatorView.isHidden = false
        indicatorView.startAnimating()
        self.viewModel.getCurrentWeather(location: city ) { [weak self] errorMessage in
            self?.indicatorView.isHidden = true
            self?.indicatorView.stopAnimating()
            if let errorMsg = errorMessage {
                self?.presentAlert(title: Constant.Error.error, message: errorMsg)
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
        weatherImg.kf.setImage(with: URL(string: API.baseUrl + (currentWeather?.current?.condition?.icon ?? "")), placeholder: UIImage(named: "rain_cloud_sun"))
        humidtyLbl.text = "Humidty: " + String(currentWeather?.current?.humidity ?? 0)
        feeelsLikeLbl.text = "FeelsLike: " + String(currentWeather?.current?.feelslike_c ?? 0) + "°"
        maxTempLbl.text = "Max: " + String(currentWeather?.forecast?.forecastday?.first?.day?.maxtemp_c ?? 0) + "°"
        lowtempLbl.text = "Min: " + String(currentWeather?.forecast?.forecastday?.first?.day?.mintemp_c ?? 0) + "°"
        let epochTime: TimeInterval = TimeInterval(currentWeather?.current?.last_updated_epoch ?? 0 )
        let date = Date(timeIntervalSince1970: epochTime)
        dateLbl.text = date.formattedDateString()
        collectionView.reloadData()
    }
    
    
}

extension TodayWeatherVC {
    
    @IBAction func refreshTapped(_ sender: UIButton) {
        getCurrentWeatherData()
    }
    
}

extension TodayWeatherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysCVCell", for: indexPath) as! DaysCVCell
        let item = viewModel.item(at: indexPath.row)
        cell.hour = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 100.0
        let cellHeight = collectionView.bounds.height - 30.0
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
