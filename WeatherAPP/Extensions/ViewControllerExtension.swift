//
//  ViewControllerExtension.swift
//  WeatherAPP
//
//  Created by Hamza Javaid on 08/03/2024.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
        
    }
}
