//
//  Dictionary.swift
//  Macmeter
//
//  Created by Muhammad Salman Zafar on 1/27/22.
//

import Foundation

extension Dictionary {
    
    func jsonData() -> Data? {
        try? JSONSerialization.data(withJSONObject: self, options: .fragmentsAllowed)
    }
    
    var toURLQueryItem: [URLQueryItem] {
        let dict = self as? [String: String] ?? [:]
        return dict.map({ URLQueryItem(name: $0.key, value: $0.value) })
    }
}
