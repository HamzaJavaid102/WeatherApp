//
//  BaseNetworkRequestable.swift
//  canva
//
//  Created by Muhammad Salman on 8/22/22.
//

import Foundation

protocol BaseNetworkRequestable: Codable {
    var jsonData: Data? { get }
    var associatedValues: [String: String] { get }
    var dictionary: [String: String] { get }
}

extension BaseNetworkRequestable {
    
    var associatedValues: [String: String] {
        var values = [String: String]()
        let mirror = Mirror(reflecting: self)
        mirror.children.forEach({
            if let label = $0.label {
                values[label] = String(describing: $0.value)
            }
        })
        return values
    }
    
    var jsonData: Data? {
        return self.encoded()
    }
    
    var dictionary: [String: String] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        let dict = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] } ?? [:]
        var tempDict = [String: String]()
        dict.forEach({ tempDict[$0.key] = String(describing: $0.value) })
        return tempDict
    }
    
}
